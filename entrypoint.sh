#!/bin/bash
echo 00000000 | go/bin/coolchaind keys import $KEYNAME $KEYNAME.key --keyring-backend test
/bin/bash
