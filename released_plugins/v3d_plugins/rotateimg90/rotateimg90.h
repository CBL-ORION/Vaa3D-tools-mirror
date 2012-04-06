
// upgrade to V3DPluginInterface2_1 2012-04-06, by Jianlong Zhou


#ifndef ROTATEIMG90PLUGIN_H
#define ROTATEIMG90PLUGIN_H


#include <v3d_interface.h>

class RotateImg90Plugin : public QObject, public V3DPluginInterface2_1
{
    Q_OBJECT
    Q_INTERFACES(V3DPluginInterface2_1)

public:
     float getPluginVersion() const {return 1.1f;}

     QStringList menulist() const;
	void domenu(const QString &menu_name, V3DPluginCallback2 &callback, QWidget *parent);

	QStringList funclist() const {return QStringList();}
     bool dofunc(const QString &func_name, const V3DPluginArgList &input, V3DPluginArgList &output, V3DPluginCallback2 &callback, QWidget *parent){return true;}

};

#endif
