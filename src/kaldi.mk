# This file was generated using the following command:
# ./configure --shared

CONFIGURE_VERSION := 6

# Toolchain configuration

CXX = g++
AR = ar
AS = as
RANLIB = ranlib

# Base configuration

KALDI_FLAVOR := dynamic
KALDILIBDIR := /export/a11/hlyu/pitch/src/lib
DOUBLE_PRECISION = 0

CXXFLAGS = -std=c++11 -I.. $(EXTRA_CXXFLAGS) \
           -Wall -Wno-sign-compare -Wno-unused-local-typedefs \
           -Wno-deprecated-declarations -Winit-self \
           -DKALDI_DOUBLEPRECISION=$(DOUBLE_PRECISION) \
           -DHAVE_EXECINFO_H=1 -DHAVE_CXXABI_H \
           -msse -msse2 -pthread \
           -g # -O0 -DKALDI_PARANOID

ifeq ($(KALDI_FLAVOR), dynamic)
CXXFLAGS += -fPIC
endif

# Compiler specific flags
COMPILER = $(shell $(CXX) -v 2>&1)
ifeq ($(findstring clang,$(COMPILER)),clang)
# Suppress annoying clang warnings that are perfectly valid per spec.
CXXFLAGS += -Wno-mismatched-tags
endif

LDFLAGS = $(EXTRA_LDFLAGS) -rdynamic
LDLIBS = $(EXTRA_LDLIBS) -lm -lpthread -ldl

# Environment configuration

