REPO = https://github.com/coq-community/coq-ext-lib
TAG = master
WORKDIR = workdir

.PHONY: all get

all: $(WORKDIR)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	git clone --recursive --depth=1 -b $(TAG) $(REPO) $(WORKDIR)
	( cd $(WORKDIR) && git apply ../extlib.patch )
	cp -r dune-files/* $(WORKDIR)/

install:
	dune install coq-ext-lib

