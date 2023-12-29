#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�vl  T��}�sF�� ?���  D  � P @s��()(hi��щ�@�d44hi�)��b2i��h�CA�� �4�&C 0L  ��H�'���И��I�A�2hf��%��iᛅ��D�̓�h����O��p���(�z���U_{@S^�ᇣ}n�Qc]������r�=y�S�����ww������v����.4�*����;o��I�Ű�Uװ����h���͈�����[��/�း}��O`�;���C��>����h55`^�T@�Bn	��o��e���c��;��-�ּ�"6����%듡�eUUV� \���m���Q��n��ǀ�צ.�	�piC�%����Z��A�%���٬m�&F�Q���*���,����n��rZ2$��q�K�Z=����7p��i&�V�u�yg�+f3]����.�չT�n��E)q�������6�\vI�$�I��\2�K���9=Z�c�,g�ߺՕ��GJ�:���;X�9�ѳ]l��U�05r�*�?Q��y��{��"�A�z6�S��HK?�w$S�	�f� 