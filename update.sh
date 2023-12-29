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
BZh91AY&SY6��  �_�Tp}���~�ގ����  D   � P @�kBڄA��M4�OPb1=L���h2�S�6�C �SɠFʘɩ��4�h    2h�F�h� 10@ 4�� 0&@�$&S'�&S!�F d4���FCE�8���p�;%ǔ��#<��]�t�5��)S�vmV.��Y������ף2�PaF9q�
�T.�� �+�l���5opE����v��xw��0~[��*�o
ڃ�N�y�o�c�e�\�8�)ȗ�Xg���n*t�k�O67�S��h$��2Beʫ����	!bE�}�ل� ���Fy��u�Y�4ܗ��%�h�.ʢ�QK\�ؒ����Z�]���7�J"}:�Kc����$��CY�R$Z���9�%{�j���L���U:��}�fl�y�3#��3���3!���	cEl�kH�#9�����s���=�2��A�e��!����S>�}�B @�����3:�;nmT��E������zQ�
�D�p�AsDę2uB����Z$
n*����eVnF�;Fr1�`S�g��]y���l���r�
��y/�S�h��%9Z!�Mك��B/�^;�{�T��e���bL�5�Hd&.�+���7+9WYe��}�bl��+�41��0�Xݷ���d�U�"/T$�4VO|����a�ʩ ���#���@�X����Iԡ�d��U��{�&�h�Ih.K�
����`��X=$�ejG���,-���p8k!� %�hsq���"��pMm�E�*Ln���(��;ā/��$	��JS��ؒ@�� �ܑN$���