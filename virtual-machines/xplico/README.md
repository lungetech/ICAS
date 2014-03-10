Example uses
============

``` sh
packer build vm.json
vagrant box add freeradius freeradius.box
vagrant up
vagrant ssh -c "radtest test 1234 localhost 1812 testing123"
```
