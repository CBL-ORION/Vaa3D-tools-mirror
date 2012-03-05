/* gsdt_func.cpp
 * Perform distance transformation on grayscale image.
 * 2012-03-02 : by Hang Xiao
 */

#include <v3d_interface.h>
#include "v3d_message.h"
#include "gsdt_func.h"
#include <vector>
#include <iostream>

#include "stackutil.h"
#include "fastmarching_dt.h"
#include "common_dialog.h"

using namespace std;

const QString title = QObject::tr("Grayscale Distance Transformation Plugin");

int gsdt(V3DPluginCallback2 &callback, QWidget *parent)
{
	v3dhandleList win_list = callback.getImageWindowList();

	if(win_list.size()<1)
	{
		QMessageBox::information(0, title, QObject::tr("No image is open."));
		return -1;
	}
	v3dhandle curwin = callback.currentImageWindow();
	Image4DSimple * p4DImage = callback.getImage(curwin);
	unsigned char * inimg1d = p4DImage->getRawDataAtChannel(0);
	int sz0 = p4DImage->getXDim();
	int sz1 = p4DImage->getYDim();
	int sz2 = p4DImage->getZDim();
	int sz3 = 1;

	vector<string> items;
	items.push_back("Background Threshold (0 ~ 255)");
	items.push_back("Connection Type (1 ~ 3)");
	CommonDialog dialog(items);
	dialog.setWindowTitle(title);
	if(dialog.exec() != QDialog::Accepted) return 0;

	int bkg_thresh = 0, cnn_type = 2;
	dialog.get_num("Background Threshold (0 ~ 255)", bkg_thresh);
	dialog.get_num("Connection Type (1 ~ 3)", cnn_type);

	cout<<"bkg_thresh = "<<bkg_thresh<<endl;
	cout<<"cnn_type = "<<cnn_type<<endl;

	float * phi = 0;
	fastmarching_dt(inimg1d, phi, sz0, sz1, sz2, cnn_type, bkg_thresh);

	float min_val = phi[0], max_val = phi[0];
	long tol_sz = sz0 * sz1 * sz2;
	unsigned char * outimg1d = new unsigned char[tol_sz];
	for(long i = 0; i < tol_sz; i++) {if(phi[i] == INF) continue; min_val = MIN(min_val, phi[i]); max_val = MAX(max_val, phi[i]);}
	cout<<"min_val = "<<min_val<<" max_val = "<<max_val<<endl;
	max_val -= min_val; if(max_val == 0.0) max_val = 0.00001;
	for(long i = 0; i < tol_sz; i++)
	{
		if(phi[i] == INF) outimg1d[i] = 0;
		else if(phi[i] ==0) outimg1d[i] = 0;
		else
		{
			outimg1d[i] = (phi[i] - min_val)/max_val * 255 + 0.5;
			outimg1d[i] = MAX(outimg1d[i], 1);
		}
	}
	delete [] phi; phi = 0;

	Image4DSimple * new4DImage = new Image4DSimple();
	new4DImage->setData(outimg1d, sz0, sz1, sz2, 1, V3D_UINT8);
	v3dhandle newwin = callback.newImageWindow();
	callback.setImage(newwin, new4DImage);
	callback.setImageName(newwin, title);
	callback.updateImageWindow(newwin);
	return 1;
}

bool gsdt(const V3DPluginArgList & input, V3DPluginArgList & output)
{
	cout<<"Welcome to gsdt"<<endl;
	if(input.size() != 2 || output.size() != 1) return false;
	int bkg_thresh = 0, cnn_type = 2, channel = 0;
	vector<char*> paras = (*(vector<char*> *)(input.at(1).p));
	if(paras.size() >= 1) bkg_thresh = atoi(paras.at(0));
	if(paras.size() >= 2) cnn_type = atoi(paras.at(1));
	if(paras.size() >= 3) channel = atoi(paras.at(2));
	char * inimg_file = ((vector<char*> *)(input.at(0).p))->at(0);
	char * outimg_file = ((vector<char*> *)(output.at(0).p))->at(0);
	cout<<"bkg_thresh = "<<bkg_thresh<<endl;
	cout<<"inimg_file = "<<inimg_file<<endl;
	cout<<"outimg_file = "<<outimg_file<<endl;
	cout<<"channel = "<<channel<<endl;

	unsigned char * inimg1d = 0,  * outimg1d = 0;
	float * phi = 0;
	V3DLONG * in_sz = 0;
	int datatype;
	if(!loadImage(inimg_file, inimg1d, in_sz, datatype, channel)) {cerr<<"load image "<<inimg_file<<" error!"<<endl; return 1;}

	if(!fastmarching_dt(inimg1d, phi, in_sz[0], in_sz[1], in_sz[2], cnn_type, bkg_thresh)) return false;

	float min_val = phi[0], max_val = phi[0];
	long tol_sz = in_sz[0] * in_sz[1] * in_sz[2];
	outimg1d = new unsigned char[tol_sz];
	for(long i = 0; i < tol_sz; i++) {if(phi[i] == INF) continue; min_val = MIN(min_val, phi[i]); max_val = MAX(max_val, phi[i]);}
	cout<<"min_val = "<<min_val<<" max_val = "<<max_val<<endl;
	max_val -= min_val; if(max_val == 0.0) max_val = 0.00001;
	for(long i = 0; i < tol_sz; i++)
	{
		if(phi[i] == INF) outimg1d[i] = 0;
		else if(phi[i] ==0) outimg1d[i] = 0;
		else
		{
			outimg1d[i] = (phi[i] - min_val)/max_val * 255 + 0.5;
			outimg1d[i] = MAX(outimg1d[i], 1);
		}
	}
	saveImage(outimg_file, outimg1d, in_sz, datatype);
	
	delete [] phi; phi = 0;
	delete [] inimg1d; inimg1d = 0;
	delete [] outimg1d; outimg1d = 0;

	return true;
}


