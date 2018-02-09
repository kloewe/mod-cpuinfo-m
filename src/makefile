#-----------------------------------------------------------------------------
# File    : makefile
# Contents: build MEX-files
# Author  : Kristian Loewe
#
# Usage   : make
#           MEX_FLAGS='-v' make
#           make | grep -v 'Warning.*gcc version'
#           make -B | grep -v 'Warning.*gcc version'
#           DEBUG=1 make -B | grep -v 'Warning.*gcc version'
#-----------------------------------------------------------------------------
.SUFFIXES:
MAKEFLAGS   += -r

CC          ?= gcc
CFBASE       = -std=c99 -Wall -Wextra -Wno-unused-parameter -Wconversion \
               -Wshadow -pedantic
DEFS        ?=
MEX_FLAGS   ?=

DEBUG       ?= 0
ifeq ($(DEBUG), 1)
  CFBASE    += -g
  CFOPT     ?= -O0
else
  CFOPT     ?= -O2
  DEFS      += -DNDEBUG
endif
CFLAGS       = $(CFBASE) -fPIC $(DEFS)

MATLABROOT   = $(dir $(realpath $(shell which matlab)))
MEXCC        = $(realpath $(MATLABROOT))/mex -largeArrayDims $(MEX_FLAGS) \
               CFLAGS='$(CFLAGS)'
MEXLD        = $(realpath $(MATLABROOT))/mex -largeArrayDims $(MEX_FLAGS)
SUF          = mexa64

_OBJDIR      = obj/$(shell uname -m)/matlab
OBJDIR       = ../$(_OBJDIR)
OUTDIR       = ../private
_DUMMY      := $(shell mkdir -p $(OBJDIR); mkdir -p $(OUTDIR))

#-----------------------------------------------------------------------------

CPUINFODIR = ../../cpuinfo

INCS         = -I$(CPUINFODIR)/src

MEX_FILES    = mxCpuinfo

#-----------------------------------------------------------------------------
# Link MEX files
#-----------------------------------------------------------------------------
all: $(MEX_FILES)

mxCpuinfo:                  $(OUTDIR)/mxCpuinfo.$(SUF)
$(OUTDIR)/mxCpuinfo.$(SUF): $(CPUINFODIR)/$(_OBJDIR)/cpuinfo.o
$(OUTDIR)/mxCpuinfo.$(SUF): $(OBJDIR)/mxCpuinfo.o makefile
	$(MEXLD)                  $(CPUINFODIR)/$(_OBJDIR)/cpuinfo.o \
                            $(OBJDIR)/mxCpuinfo.o -output $@

#-----------------------------------------------------------------------------
# cpuinfo-m objects
#-----------------------------------------------------------------------------
mxCpuinfo.o:                $(OBJDIR)/mxCpuinfo.o
$(OBJDIR)/mxCpuinfo.o:      $(CPUINFODIR)/src/cpuinfo.*
$(OBJDIR)/mxCpuinfo.o:      mxCpuinfo.c makefile
	$(MEXCC) CFLAGS='$(CFLAGS)' COPTIMFLAGS='$(CFOPT)' \
    $(INCS) -c mxCpuinfo.c -outdir $(OBJDIR)

#-----------------------------------------------------------------------------
# cpuinfo objects
#-----------------------------------------------------------------------------
MKARGS_CPUINFO = -C $(CPUINFODIR)/src -f makefile-mex cpuinfo.o
REMAKE_CPUINFO = $(shell $(MAKE) -q $(MKARGS_CPUINFO) > /dev/null 2>&1; \
                 echo $$?\>0 | bc)
ifneq ($(or $(call eq,$(REMAKE_CPUINFO),1),$(findstring B,$(MAKEFLAGS))),)
$(CPUINFODIR)/$(_OBJDIR)/cpuinfo.o: FORCE
	$(MAKE) $(MKARGS_CPUINFO)
FORCE:
endif
