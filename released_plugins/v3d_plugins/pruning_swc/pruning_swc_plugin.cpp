/* pruning_swc_plugin.cpp
 * This is a test plugin, you can use it as a demo.
 * 2014-05-02 : by Zhi Zhou
 */
 
#include "v3d_message.h"
#include <vector>
#include "pruning_swc_plugin.h"


#include "basic_surf_objs.h"
#include <iostream>
#include "my_surf_objs.h"


using namespace std;
#define getParent(n,nt) ((nt).listNeuron.at(n).pn<0)?(1000000000):((nt).hashNeuron.value((nt).listNeuron.at(n).pn))


Q_EXPORT_PLUGIN2(pruning_swc, pruning_swc);

bool export_list2file(QList<NeuronSWC> & lN, QString fileSaveName, QString fileOpenName)
{
    QFile file(fileSaveName);
    if (!file.open(QIODevice::WriteOnly|QIODevice::Text))
        return false;
    QTextStream myfile(&file);

    QFile qf(fileOpenName);
    if (! qf.open(QIODevice::ReadOnly | QIODevice::Text))
    {
#ifndef DISABLE_V3D_MSG
        v3d_msg(QString("open file [%1] failed!").arg(fileOpenName));
#endif
        return false;
    }
    QString info;
    while (! qf.atEnd())
    {
        char _buf[1000], *buf;
        qf.readLine(_buf, sizeof(_buf));
        for (buf=_buf; (*buf && *buf==' '); buf++); //skip space

        if (buf[0]=='\0')	continue;
        if (buf[0]=='#')
        {
           info = buf;
           myfile<< info.remove('\n') <<endl;
        }

    }

    for (V3DLONG i=0;i<lN.size();i++)
        myfile << lN.at(i).n <<" " << lN.at(i).type << " "<< lN.at(i).x <<" "<<lN.at(i).y << " "<< lN.at(i).z << " "<< lN.at(i).r << " " <<lN.at(i).pn << "\n";

    file.close();
    cout<<"swc file "<<fileSaveName.toStdString()<<" has been generated, size: "<<lN.size()<<endl;
    return true;
};

 
QStringList pruning_swc::menulist() const
{
	return QStringList() 
        <<tr("pruning")
		<<tr("about");
}

QStringList pruning_swc::funclist() const
{
	return QStringList()
		<<tr("help");
}

void pruning_swc::domenu(const QString &menu_name, V3DPluginCallback2 &callback, QWidget *parent)
{
    if (menu_name == tr("pruning"))
	{
                QString fileOpenName;
                fileOpenName = QFileDialog::getOpenFileName(0, QObject::tr("Open File"),
                        "",
                        QObject::tr("Supported file (*.swc *.eswc)"
                            ";;Neuron structure	(*.swc)"
                            ";;Extended neuron structure (*.eswc)"
                            ));
                if(fileOpenName.isEmpty())
                    return;
                double length = 0;
                NeuronTree nt;
                if (fileOpenName.toUpper().endsWith(".SWC") || fileOpenName.toUpper().endsWith(".ESWC"))
                {
                     bool ok;
                     nt = readSWC_file(fileOpenName);
                     length = QInputDialog::getDouble(parent, "Please specify the maximum prunned segment length","segment length:",1,0,2147483647,0.1,&ok);
                     if (!ok)
                         return;
                }

                QVector<QVector<V3DLONG> > childs;


                V3DLONG neuronNum = nt.listNeuron.size();
                childs = QVector< QVector<V3DLONG> >(neuronNum, QVector<V3DLONG>() );
                V3DLONG *flag = new V3DLONG[neuronNum];

                for (V3DLONG i=0;i<neuronNum;i++)
                {
                    flag[i] = 1;

                    V3DLONG par = nt.listNeuron[i].pn;
                    if (par<0) continue;
                    childs[nt.hashNeuron.value(par)].push_back(i);
                }

                QList<NeuronSWC> list = nt.listNeuron;
                for (int i=0;i<list.size();i++)
                {
                    if (childs[i].size()==0)
                    {
                        int index_tip = 0;
                        int parent_tip = getParent(i,nt);
                        while(childs[parent_tip].size()<2)
                        {

                            parent_tip = getParent(parent_tip,nt);
                            index_tip++;
                        }
                        if(index_tip < length)
                        {
                            flag[i] = -1;

                            int parent_tip = getParent(i,nt);
                            while(childs[parent_tip].size()<2)
                            {
                                flag[parent_tip] = -1;
                                parent_tip = getParent(parent_tip,nt);
                            }
                        }

                    }

                }

               vector<MyMarker*> before_prunning_swc = readSWC_file(fileOpenName.toStdString());
               vector<MyMarker*> after_prunning_swc;

               NeuronSWC S;
               for (int i=0;i<before_prunning_swc.size();i++)
               {
                   if(flag[i] == 1)
                   {
                       after_prunning_swc.push_back(before_prunning_swc[i]);
                   }

              }

               if(flag) {delete[] flag; flag = 0;}

               QString fileDefaultName = fileOpenName+QString("_prunned.swc");
               //write new SWC to file
               QString fileSaveName = QFileDialog::getSaveFileName(0, QObject::tr("Save File"),
                       fileDefaultName,
                       QObject::tr("Supported file (*.swc)"
                           ";;Neuron structure	(*.swc)"
                           ));

               saveSWC_file(fileSaveName.toStdString(), after_prunning_swc);


        /*       if (!export_list2file(nt_prunned.listNeuron,fileSaveName,fileOpenName))
               {
                   v3d_msg("fail to write the output swc file.");
                   return;
               }*/


	}
	else
	{
        v3d_msg(tr("This is a plugin to prun the swc file. "
			"Developed by Zhi Zhou, 2014-05-02"));
	}
}

bool pruning_swc::dofunc(const QString & func_name, const V3DPluginArgList & input, V3DPluginArgList & output, V3DPluginCallback2 & callback,  QWidget * parent)
{
	vector<char*> infiles, inparas, outfiles;
	if(input.size() >= 1) infiles = *((vector<char*> *)input.at(0).p);
	if(input.size() >= 2) inparas = *((vector<char*> *)input.at(1).p);
	if(output.size() >= 1) outfiles = *((vector<char*> *)output.at(0).p);

	if (func_name == tr("help"))
	{
		v3d_msg("To be implemented.");
	}
	else return false;

	return true;
}

