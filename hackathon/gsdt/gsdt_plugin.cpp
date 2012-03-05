/* gsdt_plugin.cpp
 * Perform distance transformation on grayscale image.
 * 2012-03-02 : by Hang Xiao
 */
 
#include <iostream>
#include "v3d_message.h"

#include "gsdt_plugin.h"
#include "gsdt_func.h"

using namespace std;

Q_EXPORT_PLUGIN2(gsdt, GrayScaleDistanceTransformationPlugin);
 
QStringList GrayScaleDistanceTransformationPlugin::menulist() const
{
	return QStringList()
		<<tr("Grayscale Distance Transformation")
		<<tr("about");
}

QStringList GrayScaleDistanceTransformationPlugin::funclist() const
{
	return QStringList()
		<<tr("gsdt")
		<<tr("help");
}

void GrayScaleDistanceTransformationPlugin::domenu(const QString &menu_name, V3DPluginCallback2 &callback, QWidget *parent)
{
	if (menu_name == tr("Grayscale Distance Transformation"))
	{
		gsdt(callback,parent);
	}
	else
	{
		v3d_msg(tr("Perform distance transformation on grayscale image.. "
			"Developed by Hang Xiao, 2012-03-02"));
	}
}

bool GrayScaleDistanceTransformationPlugin::dofunc(const QString & func_name, const V3DPluginArgList & input, V3DPluginArgList & output, V3DPluginCallback2 & callback,  QWidget * parent)
{
	if (func_name == tr("gsdt"))
	{
		return gsdt(input, output);
	}
	else if(func_name == tr("help"))
	{
		cout<<"Usage : v3d -x gsdt -f gsdt -i <inimg_file> -o <outimg_file> -p <bkg_thresh_value> <cnn_type>"<<endl;
		return true;
	}
}

