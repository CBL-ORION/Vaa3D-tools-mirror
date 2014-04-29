#include "PAnoToolBar.h"
#include "PMain.h"
#include "../control/CExplorerWindow.h"

using namespace teramanager;

PAnoToolBar* PAnoToolBar::uniqueInstance = 0;

PAnoToolBar::PAnoToolBar(QWidget *parent) : QWidget(parent)
{
    /**/itm::debug(itm::LEV1, 0, __itm__current__function__);

    // create toolbar
    toolBar = new QToolBar("ToolBar", this);
    toolBar->setOrientation(Qt::Vertical);
    toolBar->setIconSize(QSize(40,40));

    // add already existing buttons from the main GUI
    toolBar->addAction(PMain::getInstance()->loadAnnotationsAction);
    toolBar->addAction(PMain::getInstance()->saveAnnotationsAction);
    toolBar->addAction(PMain::getInstance()->saveAnnotationsAsAction);
    toolBar->addAction(PMain::getInstance()->clearAnnotationsAction);
    toolBar->addSeparator();

    // add new buttons
    buttonMarkerCreate = new QToolButton();
    buttonMarkerCreate->setIcon(QIcon(":/icons/marker_add.png"));
    buttonMarkerCreate->setCheckable(true);
    buttonMarkerCreate->setToolTip("1-right-click to define a marker");
    connect(buttonMarkerCreate, SIGNAL(toggled(bool)), this, SLOT(buttonMarkerCreateChecked(bool)));
    toolBar->insertWidget(0, buttonMarkerCreate);
    /**/
    buttonMarkerDelete = new QToolButton();
    buttonMarkerDelete->setIcon(QIcon(":/icons/marker_delete.png"));
    buttonMarkerDelete->setCheckable(true);
    buttonMarkerDelete->setToolTip("1-right-click to delete a marker");
    connect(buttonMarkerDelete, SIGNAL(toggled(bool)), this, SLOT(buttonMarkerDeleteChecked(bool)));
    toolBar->insertWidget(0, buttonMarkerDelete);
    /**/
    buttonMarkerRoiDelete = new QToolButton();
    buttonMarkerRoiDelete->setIcon(QIcon(":/icons/marker_delete_roi.png"));
    buttonMarkerRoiDelete->setCheckable(true);
    buttonMarkerRoiDelete->setToolTip("1-right-stroke to delete a group of markers");
    connect(buttonMarkerRoiDelete, SIGNAL(toggled(bool)), this, SLOT(buttonMarkerRoiDeleteChecked(bool)));
    toolBar->insertWidget(0, buttonMarkerRoiDelete);
    toolBar->addSeparator();
    /**/
    buttonMarkerRoiView = new QToolButton();
    buttonMarkerRoiView->setIcon(QIcon(":/icons/marker_roi_view.png"));
    buttonMarkerRoiView->setCheckable(true);
    buttonMarkerRoiView->setToolTip("Show/hide markers around the displayed ROI");
    connect(buttonMarkerRoiView, SIGNAL(toggled(bool)), this, SLOT(buttonMarkerRoiViewChecked(bool)));
    toolBar->insertWidget(0, buttonMarkerRoiView);

    // layout
    QVBoxLayout* layout = new QVBoxLayout();
    layout->addWidget(toolBar);
    layout->setContentsMargins(0,0,0,0);
    setLayout(layout);


    // make it appear as a true toolbar
    this->setContentsMargins(0,0,0,0);
    this->setWindowFlags(Qt::Tool | Qt::FramelessWindowHint | Qt::WindowStaysOnTopHint);
    setAttribute(Qt::WA_TranslucentBackground);
    toolBar->setStyleSheet("QToolBar{background:qlineargradient(x1: 0, y1: 0, x2: 1, y2: 0,"
                           "stop: 0 rgb(180,180,180), stop: 1 rgb(220,220,220));"
                           "border-style: outset;"
                           "border-width: 1px;"
                           "border-radius: 5px;"
                           "border-color: rgb(50,50,50);} ");
                           //"QToolBar::separator::horizontal{width: 5px; height: 10px;}");

    // install event filter
    QCoreApplication::instance()->installEventFilter(this);

    // show tooltips also when has no focus on it
    setAttribute(Qt::WA_AlwaysShowToolTips, true);
}


void PAnoToolBar::buttonMarkerCreateChecked(bool checked)
{
     /**/itm::debug(itm::LEV3, strprintf("checked = %s", checked ? "true" : "false").c_str(), __itm__current__function__);

    CExplorerWindow* expl = CExplorerWindow::getCurrent();

    if(checked)
    {
        // uncheck other buttons but the current one
        if(buttonMarkerDelete->isChecked())
            buttonMarkerDelete->setChecked(false);
        if(buttonMarkerRoiDelete->isChecked())
            buttonMarkerRoiDelete->setChecked(false);


        // change cursor
        QPixmap cur_img(":/icons/cursor_marker_add.png");
        cur_img = cur_img.scaled(32,32,Qt::KeepAspectRatio, Qt::SmoothTransformation);
        setCursor(QCursor(cur_img, 0, 0));
        CExplorerWindow::setCursor(QCursor(cur_img, 0, 0), true);

        // switch to Vaa3D's 1-right-click marker create mode
        if(expl)
        {
            expl->view3DWidget->getRenderer()->selectMode = Renderer::smMarkerCreate1;
            static_cast<Renderer_gl1*>(expl->view3DWidget->getRenderer())->b_addthismarker = true;
        }
    }
    else
    {
        // set default cursor
        setCursor(Qt::ArrowCursor);
        CExplorerWindow::setCursor(Qt::ArrowCursor, true);

        // end marker create mode
        if(expl)
            expl->view3DWidget->getRenderer()->endSelectMode();
    }
}


void PAnoToolBar::buttonMarkerDeleteChecked(bool checked)
{
     /**/itm::debug(itm::LEV3, strprintf("checked = %s", checked ? "true" : "false").c_str(), __itm__current__function__);

    CExplorerWindow* expl = CExplorerWindow::getCurrent();

    if(checked)
    {
        // uncheck other buttons but the current one
        if(buttonMarkerCreate->isChecked())
            buttonMarkerCreate->setChecked(false);
        if(buttonMarkerRoiDelete->isChecked())
            buttonMarkerRoiDelete->setChecked(false);

        if(expl)
        {
            // change cursor
            QPixmap cur_img(":/icons/cursor_marker_delete.png");
            cur_img = cur_img.scaled(32,32,Qt::KeepAspectRatio, Qt::SmoothTransformation);
            setCursor(QCursor(cur_img, 0,0));
            CExplorerWindow::setCursor(QCursor(cur_img, 0, 0), true);

//            if(expl)
//            {
//                expl->view3DWidget->getRenderer()->selectMode = Renderer::smMarkerCreate1;
//                static_cast<Renderer_gl1*>(expl->view3DWidget->getRenderer())->b_addthismarker = false;
//                static_cast<Renderer_gl1*>(expl->view3DWidget->getRenderer())->b_imaging = false;
//                static_cast<Renderer_gl1*>(expl->view3DWidget->getRenderer())->b_grabhighrez = true;
//            }
        }
    }
    else
    {
        // set default cursor
        setCursor(Qt::ArrowCursor);
        CExplorerWindow::setCursor(Qt::ArrowCursor, true);

        // end marker delete mode
//        if(expl)
//        {
//            expl->view3DWidget->getRenderer()->endSelectMode();
//            expl->view3DWidget->getRenderer()->selectMode = Renderer::smObject;
//            static_cast<Renderer_gl1*>(expl->view3DWidget->getRenderer())->b_grabhighrez = false;
//        }
    }
}


void PAnoToolBar::buttonMarkerRoiDeleteChecked(bool checked)
{
     /**/itm::debug(itm::LEV3, strprintf("checked = %s", checked ? "true" : "false").c_str(), __itm__current__function__);

    CExplorerWindow* expl = CExplorerWindow::getCurrent();

    if(checked)
    {
        // uncheck other buttons but the current one
        if(buttonMarkerCreate->isChecked())
            buttonMarkerCreate->setChecked(false);
        if(buttonMarkerDelete->isChecked())
            buttonMarkerDelete->setChecked(false);

        // change cursor
        QPixmap cur_img(":/icons/cursor_marker_delete_roi.png");
        cur_img = cur_img.scaled(32,32,Qt::KeepAspectRatio, Qt::SmoothTransformation);
        setCursor(QCursor(cur_img, 0,0));
        CExplorerWindow::setCursor(QCursor(cur_img, 0, 0), true);

        // switch to Vaa3D's mode "Zoom-in HighRezImage: 1-right stroke ROI"
        if(expl)
        {
            expl->view3DWidget->getRenderer()->selectMode = Renderer::smCurveCreate1;
            static_cast<Renderer_gl1*>(expl->view3DWidget->getRenderer())->b_addthiscurve = false;
            static_cast<Renderer_gl1*>(expl->view3DWidget->getRenderer())->b_imaging = false;
            static_cast<Renderer_gl1*>(expl->view3DWidget->getRenderer())->b_grabhighrez = true;
        }
    }
    else
    {
        // set default cursor
        setCursor(Qt::ArrowCursor);
        CExplorerWindow::setCursor(Qt::ArrowCursor, true);

        // end Vaa3D's mode "Zoom-in HighRezImage: 1-right stroke ROI"
        if(expl)
        {
            expl->view3DWidget->getRenderer()->selectMode = Renderer::smObject;
            static_cast<Renderer_gl1*>(expl->view3DWidget->getRenderer())->b_grabhighrez = false;
        }
    }
}


void PAnoToolBar::buttonMarkerRoiViewChecked(bool checked)
{
     /**/itm::debug(itm::LEV3, strprintf("checked = %s", checked ? "true" : "false").c_str(), __itm__current__function__);

    CExplorerWindow* expl = CExplorerWindow::getCurrent();

    if(checked)
    {
        QMessageBox::information(this, "Warning", "Not yet implemented");
        buttonMarkerRoiView->setChecked(false);
    }

    if(checked)
    {
//        // uncheck other buttons but the current one
//        if(buttonMarkerCreate->isChecked())
//            buttonMarkerCreate->setChecked(false);
//        if(buttonMarkerDelete->isChecked())
//            buttonMarkerDelete->setChecked(false);
//        if(buttonMarkerRoiDelete->isChecked())
//            buttonMarkerRoiDelete->setChecked(false);
    }
    else
    {
        // set default cursor
//        CExplorerWindow::setCursor(Qt::ArrowCursor, true);
    }
}

/**********************************************************************************
* Intercepts global key pressed events
***********************************************************************************/
bool PAnoToolBar::eventFilter(QObject *object, QEvent *event)
{
    if(event->type() == 6)
    {
        QKeyEvent *KeyEvent = (QKeyEvent*)event;
        if(KeyEvent->key() == Qt::Key_Escape)
            releaseTools();
    }
    return false;
}

/**********************************************************************************
* Release currently activated tools, if any
***********************************************************************************/
void PAnoToolBar::releaseTools()
{
    /**/itm::debug(itm::LEV3, 0, __itm__current__function__);

    if(buttonMarkerCreate->isChecked())
        buttonMarkerCreate->setChecked(false);
    if(buttonMarkerDelete->isChecked())
        buttonMarkerDelete->setChecked(false);
    if(buttonMarkerRoiDelete->isChecked())
        buttonMarkerRoiDelete->setChecked(false);
}

/**********************************************************************************
* Refresh currently activated tools, if any
***********************************************************************************/
void PAnoToolBar::refreshTools()
{
    /**/itm::debug(itm::LEV_MAX, 0, __itm__current__function__);

    if(buttonMarkerCreate->isChecked())
        buttonMarkerCreateChecked(true);
    if(buttonMarkerDelete->isChecked())
        buttonMarkerDeleteChecked(true);
    if(buttonMarkerRoiDelete->isChecked())
        buttonMarkerRoiDeleteChecked(true);
}

/**********************************************************************************
* Align the current widget to the left of the given widget
***********************************************************************************/
void PAnoToolBar::alignToLeft(QWidget* widget)
{
    /**/itm::debug(itm::LEV_MAX, 0, __itm__current__function__);

    int new_x = widget->mapToGlobal(QPoint(0,0)).x();
    int new_y = widget->mapToGlobal(QPoint(0,0)).y();
    move(new_x, new_y);
}

