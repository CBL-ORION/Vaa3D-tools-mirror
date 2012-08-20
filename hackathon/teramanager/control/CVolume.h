//------------------------------------------------------------------------------------------------
// Copyright (c) 2012  Alessandro Bria and Giulio Iannello (University Campus Bio-Medico of Rome).
// All rights reserved.
//------------------------------------------------------------------------------------------------

/*******************************************************************************************************************************************************************************************
*    LICENSE NOTICE
********************************************************************************************************************************************************************************************
*    By downloading/using/running/editing/changing any portion of codes in this package you agree to this license. If you do not agree to this license, do not download/use/run/edit/change
*    this code.
********************************************************************************************************************************************************************************************
*    1. This material is free for non-profit research, but needs a special license for any commercial purpose. Please contact Alessandro Bria at a.bria@unicas.it or Giulio Iannello at
*       g.iannello@unicampus.it for further details.
*    2. You agree to appropriately cite this work in your related studies and publications.
*
*       Bria, A., et al., (2012) "Stitching Terabyte-sized 3D Images Acquired in Confocal Ultramicroscopy", Proceedings of the 9th IEEE International Symposium on Biomedical Imaging.
*       Bria, A., Iannello, G., "A Tool for Fast 3D Automatic Stitching of Teravoxel-sized Datasets", submitted on July 2012 to IEEE Transactions on Information Technology in Biomedicine.
*
*    3. This material is provided by  the copyright holders (Alessandro Bria  and  Giulio Iannello),  University Campus Bio-Medico and contributors "as is" and any express or implied war-
*       ranties, including, but  not limited to,  any implied warranties  of merchantability,  non-infringement, or fitness for a particular purpose are  disclaimed. In no event shall the
*       copyright owners, University Campus Bio-Medico, or contributors be liable for any direct, indirect, incidental, special, exemplary, or  consequential  damages  (including, but not
*       limited to, procurement of substitute goods or services; loss of use, data, or profits;reasonable royalties; or business interruption) however caused  and on any theory of liabil-
*       ity, whether in contract, strict liability, or tort  (including negligence or otherwise) arising in any way out of the use of this software,  even if advised of the possibility of
*       such damage.
*    4. Neither the name of University  Campus Bio-Medico of Rome, nor Alessandro Bria and Giulio Iannello, may be used to endorse or  promote products  derived from this software without
*       specific prior written permission.
********************************************************************************************************************************************************************************************/

#ifndef CLOADSUBVOLUME_H
#define CLOADSUBVOLUME_H

#include <QThread>
#include <string>
#include "CPlugin.h"
#include "CImport.h"

class teramanager::CVolume : public QThread
{
    Q_OBJECT

    private:

        /*********************************************************************************
        * Singleton design pattern: this class can have one instance only,  which must be
        * instantiated by calling static method "istance(...)"
        **********************************************************************************/
        static CVolume* uniqueInstance;
        CVolume() : QThread()
        {
            #ifdef TMP_DEBUG
            printf("teramanager plugin [thread %d] >> CVolume created\n", this->thread()->currentThreadId());
            #endif

            voiResIndex = -1;
            voiData = 0;
            voiV0 = voiV1 = voiH0 = voiH1 = voiD0 = voiD1 = -1;
            sourceObject = 0;
        }

        //automatically called when current thread is started
        void run();

        //members
        int voiResIndex;                            //volume of interest resolution index
        int voiV0,voiV1,voiH0,voiH1,voiD0,voiD1;    //volume of interest coordinates
        uint8* voiData;                             //volume of interest data
        void* sourceObject;                         //the object that requested the VOI

    public:

        /*********************************************************************************
        * Singleton design pattern: this class can have one instance only,  which must be
        * instantiated by calling static method "istance(...)"
        **********************************************************************************/
        static CVolume* instance()
        {
            if (uniqueInstance == NULL)
                uniqueInstance = new CVolume();
            return uniqueInstance;
        }
        static void uninstance();
        ~CVolume();

        //GET and SET methods
        uint8* getVoiData(){return voiData;}
        void resetVoiData(){voiData = 0;}
        int getVoiV0(){return voiV0;}
        int getVoiV1(){return voiV1;}
        int getVoiH0(){return voiH0;}
        int getVoiH1(){return voiH1;}
        int getVoiD0(){return voiD0;}
        int getVoiD1(){return voiD1;}
        int getVoiResIndex(){return voiResIndex;}
        void setVoi(void* _sourceObject, int _voiResIndex, int _V0, int _V1, int _H0, int _H1, int _D0, int _D1)
        {
            sourceObject = _sourceObject;
            voiResIndex = _voiResIndex;
            StackedVolume* volume = CImport::instance()->getVolume(voiResIndex);
            voiV0 = MAX(_V0, 0);
            voiV1 = MIN(_V1, volume->getDIM_V());
            voiH0 = MAX(_H0, 0);
            voiH1 = MIN(_H1, volume->getDIM_H());
            voiD0 = MAX(_D0, 0);
            voiD1 = MIN(_D1, volume->getDIM_D());
        }

    signals:

        /*********************************************************************************
        * Carries the outcome of the operation associated  to this thread  as well as the
        * the object that requested the operation
        **********************************************************************************/
        void sendOperationOutcome(MyException* ex, void* sourceObj);
};

#endif // CLOADSUBVOLUME_H
