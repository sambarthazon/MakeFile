####################
# Compiler options #
####################
CC = g++
FLAGS = -std=c++11 -Wall -Wextra -pedantic

###############
# Directories #
###############
SRCDIR = ./src
OBJDIR = ./bin/obj
BINDIR = ./bin

###################
# Files extension #
###################
SRCEXT=cpp
OBJEXT=o

##############
# Executable #
##############
EXECUTABLE=rubikscube

#########
# Files #
#########
TARGET = $(BINDIR)/$(EXECUTABLE)
SOURCES = $(wildcard $(SRCDIR)/*.$(SRCEXT))
OBJECTS = $(patsubst $(SRCDIR)/%.$(SRCEXT),$(OBJDIR)/%.$(OBJEXT),$(SOURCES))

##################
# Default target #
##################
all: $(TARGET)

###########
# Linking #
###########
$(TARGET): $(OBJECTS)
	$(CC) $(FLAGS) -o $@ $^

#############
# Compiling #
#############
$(OBJDIR)/%.$(OBJEXT): $(SRCDIR)/%.$(SRCEXT)
	$(CC) $(FLAGS) -c $< -o $@

#####################
# Build directories #
#####################
build:
	mkdir -p $(OBJDIR)

#####################
# Clear directories #
#####################
clear:
	rm -rf $(BINDIR)