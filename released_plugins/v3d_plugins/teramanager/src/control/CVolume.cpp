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

#include <typeinfo>
#include "CVolume.h"
#include "CImport.h"
#include "../presentation/PLog.h"

using namespace teramanager;

CVolume* CVolume::uniqueInstance = NULL;

void CVolume::uninstance()
{
    #ifdef TMP_DEBUG
    printf("--------------------- teramanager plugin [thread ?] >> CVolume::uninstance()\n");
    #endif

    if(uniqueInstance)
    {
        delete uniqueInstance;
        uniqueInstance = NULL;
    }
}

CVolume::~CVolume()
{
    #ifdef TMP_DEBUG
    printf("--------------------- teramanager plugin [thread *] >> CVolume::~CVolume()\n");
    printf("--------------------- teramanager plugin [thread *] >> CVolume destroyed\n");
    #endif
}

int CVolume::scaleVCoord(int coord, int srcRes, int dstRes) throw (MyException)
{
    #ifdef TMP_DEBUG
    printf("--------------------- teramanager plugin [thread ?] >> CVolume::scaleVCoord(coord = %d, srcRes = %d, dstRes = %d)\n",
           coord, srcRes, dstRes);
    #endif

    //checks
    if(srcRes < 0 || srcRes >= CImport::instance()->getResolutions())
        throw MyException("Invalid source resolution of coordinate mapping operation");
    if(dstRes < 0 || dstRes >= CImport::instance()->getResolutions())
        throw MyException("Invalid destination resolution of coordinate mapping operation");

    //computation
    if(srcRes == dstRes)
        return coord;
    // --- Alessandro added on August 8th, 2013: useful for exact boundary conversion ---
    else if(coord == CImport::instance()->getVolume(srcRes)->getDIM_V())
        return CImport::instance()->getVolume(dstRes)->getDIM_V();
    else
    {
        float ratio = (CImport::instance()->getVolume(dstRes)->getDIM_V()-1.0f)/(CImport::instance()->getVolume(srcRes)->getDIM_V()-1.0f);
        return static_cast<int>(coord*ratio + 0.5f);
    }
}

int CVolume::scaleHCoord(int coord, int srcRes, int dstRes) throw (MyException)
{
    #ifdef TMP_DEBUG
    printf("--------------------- teramanager plugin [thread ?] >> CVolume::scaleHCoord(coord = %d, srcRes = %d, dstRes = %d)\n",
           coord, srcRes, dstRes);
    #endif

    //checks
    if(srcRes < 0 || srcRes >= CImport::instance()->getResolutions())
        throw MyException("Invalid source resolution of coordinate mapping operation");
    if(dstRes < 0 || dstRes >= CImport::instance()->getResolutions())
        throw MyException("Invalid destination resolution of coordinate mapping operation");

    //computation
    if(srcRes == dstRes)
        return coord;
    else if(coord == CImport::instance()->getVolume(srcRes)->getDIM_H())
        return CImport::instance()->getVolume(dstRes)->getDIM_H();
    else
    {
        float ratio = (CImport::instance()->getVolume(dstRes)->getDIM_H()-1.0f)/(CImport::instance()->getVolume(srcRes)->getDIM_H()-1.0f);
        return static_cast<int>(coord*ratio + 0.5f);
    }
}

int CVolume::scaleDCoord(int coord, int srcRes, int dstRes) throw (MyException)
{
    #ifdef TMP_DEBUG
    printf("--------------------- teramanager plugin [thread ?] >> CVolume::scaleDCoord(coord = %d, srcRes = %d, dstRes = %d)\n",
           coord, srcRes, dstRes);
    #endif

    //checks
    if(srcRes < 0 || srcRes >= CImport::instance()->getResolutions())
        throw MyException("Invalid source resolution of coordinate mapping operation");
    if(dstRes < 0 || dstRes >= CImport::instance()->getResolutions())
        throw MyException("Invalid destination resolution of coordinate mapping operation");

    //computation
    if(srcRes == dstRes)
        return coord;
    else if(coord == CImport::instance()->getVolume(srcRes)->getDIM_D())
        return CImport::instance()->getVolume(dstRes)->getDIM_D();
    else
    {
        float ratio = (CImport::instance()->getVolume(dstRes)->getDIM_D()-1.0f)/(CImport::instance()->getVolume(srcRes)->getDIM_D()-1.0f);
        return static_cast<int>(coord*ratio + 0.5f);
    }
}

float CVolume::scaleVCoord(float coord, int srcRes, int dstRes) throw (MyException)
{
    #ifdef TMP_DEBUG
    printf("--------------------- teramanager plugin [thread ?] >> CVolume::scaleVCoord(coord = %.1f, srcRes = %.1f, dstRes = %.1f)\n",
           coord, srcRes, dstRes);
    #endif

    //checks
    if(srcRes < 0 || srcRes >= CImport::instance()->getResolutions())
        throw MyException("Invalid source resolution of coordinate mapping operation");
    if(dstRes < 0 || dstRes >= CImport::instance()->getResolutions())
        throw MyException("Invalid destination resolution of coordinate mapping operation");

    //computation
    if(srcRes == dstRes)
        return coord;
    else if(coord == static_cast<float>(CImport::instance()->getVolume(srcRes)->getDIM_V()))
        return static_cast<float>(CImport::instance()->getVolume(dstRes)->getDIM_V());
    else
    {
        float ratio = (CImport::instance()->getVolume(dstRes)->getDIM_V()-1.0f)/(CImport::instance()->getVolume(srcRes)->getDIM_V()-1.0f);
        return coord*ratio;
    }
}

float CVolume::scaleHCoord(float coord, int srcRes, int dstRes) throw (MyException)
{
    #ifdef TMP_DEBUG
    printf("--------------------- teramanager plugin [thread ?] >> CVolume::scaleHCoord(coord = %.1f, srcRes = %.1f, dstRes = %.1f)\n",
           coord, srcRes, dstRes);
    #endif

    //checks
    if(srcRes < 0 || srcRes >= CImport::instance()->getResolutions())
        throw MyException("Invalid source resolution of coordinate mapping operation");
    if(dstRes < 0 || dstRes >= CImport::instance()->getResolutions())
        throw MyException("Invalid destination resolution of coordinate mapping operation");

    //computation
    if(srcRes == dstRes)
        return coord;
    else if(coord == static_cast<float>(CImport::instance()->getVolume(srcRes)->getDIM_H()))
        return static_cast<float>(CImport::instance()->getVolume(dstRes)->getDIM_H());
    else
    {
        float ratio = (CImport::instance()->getVolume(dstRes)->getDIM_H()-1.0f)/(CImport::instance()->getVolume(srcRes)->getDIM_H()-1.0f);
        return coord*ratio;
    }
}

float CVolume::scaleDCoord(float coord, int srcRes, int dstRes) throw (MyException)
{
    #ifdef TMP_DEBUG
    printf("--------------------- teramanager plugin [thread ?] >> CVolume::scaleDCoord(coord = %.1f, srcRes = %.1f, dstRes = %.1f)\n",
           coord, srcRes, dstRes);
    #endif

    //checks
    if(srcRes < 0 || srcRes >= CImport::instance()->getResolutions())
        throw MyException("Invalid source resolution of coordinate mapping operation");
    if(dstRes < 0 || dstRes >= CImport::instance()->getResolutions())
        throw MyException("Invalid destination resolution of coordinate mapping operation");

    //computation
    if(srcRes == dstRes)
        return coord;
    else if(coord == static_cast<float>(CImport::instance()->getVolume(srcRes)->getDIM_D()))
        return static_cast<float>(CImport::instance()->getVolume(dstRes)->getDIM_D());
    else
    {
        float ratio = (CImport::instance()->getVolume(dstRes)->getDIM_D()-1.0f)/(CImport::instance()->getVolume(srcRes)->getDIM_D()-1.0f);
        return coord*ratio;
    }
}

//automatically called when current thread is started
void CVolume::run()
{
    #ifdef TMP_DEBUG
    printf("--------------------- teramanager plugin [thread *] >> CVolume::run()\n");
    #endif

    try
    {
        VirtualVolume* volume = CImport::instance()->getVolume(voiResIndex);
        char msg[1024];

        //---- Alessandro 2013-04-17: if VOI exceeds limits it is automatically adjusted. This is very useful in the cases the user is zooming-in
        //around peripheral regions
        voiV0 = voiV0 >=0                   ? voiV0 : 0;
        voiV1 = voiV1 <= volume->getDIM_V() ? voiV1 : volume->getDIM_V();
        voiH0 = voiH0 >=0                   ? voiH0 : 0;
        voiH1 = voiH1 <= volume->getDIM_H() ? voiH1 : volume->getDIM_H();
        voiD0 = voiD0 >=0                   ? voiD0 : 0;
        voiD1 = voiD1 <= volume->getDIM_D() ? voiD1 : volume->getDIM_D();

        //checking subvolume interval
        if(voiV1 - voiV0 <=0 || voiH1 - voiH0 <=0 || voiD1 - voiD0 <=0)
        {
            sprintf(msg, "Invalid subvolume intervals inserted: X=[%d, %d), Y=[%d, %d), Z=[%d, %d)", voiH0, voiH1, voiV0, voiV1, voiD0, voiD1);
            throw MyException(msg);
        }

        //checking for an imported volume
        if(volume)
        {
            if(streamingSteps == 1)
            {
                QElapsedTimer timerIO;
                timerIO.start();
                uint8* voiData = volume->loadSubvolume_to_UINT8(voiV0, voiV1, voiH0, voiH1, voiD0, voiD1, &nchannels);

                sprintf(msg, "Block X=[%d, %d) Y=[%d, %d) Z=[%d, %d) loaded from res %d",
                        voiH0, voiH1, voiV0, voiV1, voiD0, voiD1, voiResIndex);

                emit sendOperationOutcome(voiData, 0, sourceObject, timerIO.elapsed(), msg, 1);
            }
            else
            {
                TiledVolume* vaa3D_volume = dynamic_cast<TiledVolume*>(volume);
                if(!vaa3D_volume)
                    throw MyException("Streaming not yet supported for the current format. Please restart the plugin.");

                //VERSION 1: reading/writing from/to the same buffer (unsafe, see Producer-Consumer problem)
                void *stream_descr = vaa3D_volume->streamedLoadSubvolume_open(streamingSteps, prebufferedData, voiV0, voiV1, voiH0, voiH1, voiD0, voiD1);
                for (int currentStep = 1; currentStep <= streamingSteps; currentStep++)
                {
                    QElapsedTimer timerIO;
                    timerIO.start();
                    prebufferedData = vaa3D_volume->streamedLoadSubvolume_dostep(stream_descr);

                    sprintf(msg, "Streaming %d/%d: Block X=[%d, %d) Y=[%d, %d) Z=[%d, %d) loaded from res %d",
                            currentStep, streamingSteps, voiH0, voiH1, voiV0, voiV1, voiD0, voiD1, voiResIndex);

                    emit sendOperationOutcome(prebufferedData, 0, sourceObject, timerIO.elapsed(), msg, currentStep);
                }
                prebufferedData = vaa3D_volume->streamedLoadSubvolume_close(stream_descr);

                //VERSION 2:reading/writing from/to different buffers (unsafe, see Producer-Consumer problem)
                /*size_t data_size = (voiV1-voiV0) * (voiH1-voiH0) * (voiD1-voiD0) * vaa3D_volume->getCHANS();
                void *stream_descr = vaa3D_volume->streamedLoadSubvolume_open(streamingSteps, prebufferedData, voiV0, voiV1, voiH0, voiH1, voiD0, voiD1);
                for (int currentStep = 1; currentStep <= streamingSteps; currentStep++)
                {
                    QElapsedTimer timerIO;
                    timerIO.start();
                    prebufferedData = vaa3D_volume->streamedLoadSubvolume_dostep(stream_descr);

                    uint8* voiData = new uint8[data_size];
                    for(uint8 *buf_p = prebufferedData, *data_p = voiData; buf_p - prebufferedData < data_size; buf_p++, data_p++)
                        *data_p = *buf_p;


                    sprintf(msg, "Streaming %d/%d: Block X=[%d, %d) Y=[%d, %d) Z=[%d, %d) loaded from res %d (step %d/%d)",
                            currentStep, streamingSteps, voiH0, voiH1, voiV0, voiV1, voiD0, voiD1, voiResIndex);

                    emit sendOperationOutcome(voiData, 0, sourceObject, timerIO.elapsed(), msg, currentStep);
                }*/
            }
        }
        else
            throw MyException("No volume has been imported yet.");


    }
    catch( MyException& exception)  {emit sendOperationOutcome(0, new MyException(exception.what()), sourceObject);}
    catch(const char* error)        {emit sendOperationOutcome(0, new MyException(error), sourceObject);}
    catch(...)                      {emit sendOperationOutcome(0, new MyException("Unknown error occurred"), sourceObject);}
}

