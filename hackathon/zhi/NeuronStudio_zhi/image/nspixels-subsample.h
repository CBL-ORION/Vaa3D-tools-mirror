#ifndef __NS_IMAGE_PIXELS_SUBSAMPLE_H__
#define __NS_IMAGE_PIXELS_SUBSAMPLE_H__

#include <image/nspixels.h>
#include <ext/subsample.h>

NS_DECLS_BEGIN

enum
	{
	NS_PIXEL_PROC_SUBSAMPLE_PIXEL_TYPE,
	NS_PIXEL_PROC_SUBSAMPLE_SRC_PIXELS,
	NS_PIXEL_PROC_SUBSAMPLE_SRC_WIDTH,
	NS_PIXEL_PROC_SUBSAMPLE_SRC_HEIGHT,
	NS_PIXEL_PROC_SUBSAMPLE_SRC_LENGTH,
	NS_PIXEL_PROC_SUBSAMPLE_SRC_ROW_ALIGN,
	NS_PIXEL_PROC_SUBSAMPLE_DEST_PIXELS,
	NS_PIXEL_PROC_SUBSAMPLE_DEST_WIDTH,
	NS_PIXEL_PROC_SUBSAMPLE_DEST_HEIGHT,
	NS_PIXEL_PROC_SUBSAMPLE_DEST_LENGTH,
	NS_PIXEL_PROC_SUBSAMPLE_DEST_ROW_ALIGN,
	NS_PIXEL_PROC_SUBSAMPLE_SCALE_X,
	NS_PIXEL_PROC_SUBSAMPLE_SCALE_Y,
	NS_PIXEL_PROC_SUBSAMPLE_SCALE_Z,
	NS_PIXEL_PROC_SUBSAMPLE_PROGRESS,

	NS_PIXEL_PROC_SUBSAMPLE_NUM_PARAMS
	};

NS_IMPEXP NsProc* ns_pixel_proc_subsample( void );

NS_DECLS_END

#endif/* __NS_IMAGE_PIXELS_SUBSAMPLE_H__ */