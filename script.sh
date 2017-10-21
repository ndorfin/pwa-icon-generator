sourceImageMedium="touch-icon-128x128.png"
sizeArrayMedium="\
57x57:apple-touch-icon-precomposed.png \
57x57:apple-touch-icon-57x57-precomposed.png \
72x72:apple-touch-icon-72x72-precomposed.png \
96x96:touch-icon-96x96.png \
114x114:apple-touch-icon-114x114-precomposed.png \
120x120:apple-touch-icon-120x120-precomposed.png \
"

sourceImageLarge="touch-icon-256x256.png"
sizeArrayLarge="\
144x144:apple-touch-icon-144x144-precomposed.png \
150x150:ms-touch-icon-150x150.png \
152x152:apple-touch-icon-152x152-precomposed.png \
167x167:apple-touch-icon-167x167-precomposed.png \
180x180:apple-touch-icon-180x180-precomposed.png \
180x180:apple-touch-icon.png \
192x192:touch-icon-192x192.png\
"

function getArguments {
  convert $sourceImage -resize $1 -unsharp 0x6+0.5+0 $2
}

function getOuterArray {
  for size in $sourceArray
  do
    getArguments `echo $size | tr : " "`
  done
}

sourceImage="$sourceImageLarge"
sourceArray="$sizeArrayLarge"
getOuterArray

sourceImage="$sourceImageMedium"
sourceArray="$sizeArrayMedium"
getOuterArray

# 57 -> precomposed
# 180 ->:apple-touch-icon
