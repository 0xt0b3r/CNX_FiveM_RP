if [[ $(cat esx_ident_test/.git/config | grep ArkSeyonet) = "" ]]; then
echo "no"
rm -R esx_ident_test;
git clone https://github.com/ArkSeyonet/esx_identity_es5 esx_ident_test;
else
echo "yes"
fi
