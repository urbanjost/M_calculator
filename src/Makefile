#@(#) Makefile started by makeout(1) 2019-12-23 02:32:55
# generated by:   ...

PROGFILES = \
 ../PROGRAMS/calculator.f90 \
 ../PROGRAMS/expression.f90 \
 ../PROGRAMS/dnum0.f90 \
 ../PROGRAMS/inum0.f90 \
 ../PROGRAMS/rnum0.f90 \
 ../PROGRAMS/snum0.f90 \
 $(NULL)

CPROGFILES = 

PROG = ${PROGFILES:.f90=}

CPROG = ${CPROGFILES:.c=}

SRCS =  M_calculator.f90 

OBJS =  M_calculator.o 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# platform-specific values you will probably change
# 
LIBS := 
CC := cc
CFLAGS := -O
FC := gfortran
FFLAGS := -O
LDFLAGS := 
# 
# You can either ignore it, or disable the "may be used uninitialized"
# warnings with -Wno-maybe-uninitialized or compile with optimizations
# (-O1 and more).
gfortran: F90FLAGS := -g -O -Wall -std=f2018 -Wextra -Wno-maybe-uninitialized -Wno-uninitialized
gfortran: all
	@echo built with $(F90)

nvfortran: F90=nvfortran
nvfortran: F90FLAGS := -Minform=inform -Mbackslash -traceback
nvfortran: all
	@echo built with $(F90)

ifort: F90=ifort
ifort: F90FLAGS := -warn all -traceback
ifort: all
	@echo built with $(F90)

nagfor: F90=nagfor
nagfor: F90FLAGS := -C all
nagfor: all
	@echo built with $(F90)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
all: $(PROG) $(CPROG)
	@echo "That's all Folks!"

$(PROG): $(OBJS)

	-$(F90) $(LDFLAGS) $@.f90 -o $@ $(OBJS) $(LIBS)||echo "ouch: $@.f90 "

clean:
	rm -f $(PROG) $(CPROG) $(OBJS) *.mod *.o none

.SUFFIXES: $(SUFFIXES) .f90 .F90

.f90.o:
	$(F90) $(F90FLAGS) -c $<

.F90.o:
	$(F90) $(F90FLAGS) -c $<
