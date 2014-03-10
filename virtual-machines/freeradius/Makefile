all:
	@echo Make targets include: build, setup, test-auth, and clean

setup:
	vagrant up

test-auth:
	vagrant ssh -c "radtest test 1234 localhost 1812 testing123"

build:
	packer build vm.json
	vagrant box add freeradius ./freeradius.box

clean:
	rm -f freeradius.box
	vagrant destroy -f
	vagrant box remove freeradius 
