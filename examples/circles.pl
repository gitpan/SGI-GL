#!/usr/local/bin/perl

# This is a Perl version of the program 'circles' from the Graphics Library
# Programming Guide, chapter 11

use SGI::GL;

SGI::GL::prefsize 400, 400;
SGI::GL::winopen "circles";
SGI::GL::color &SGI::GL::BLACK;
SGI::GL::clear;
SGI::GL::writemask &SGI::GL::RED;
SGI::GL::color &SGI::GL::RED;
SGI::GL::circfi 150, 250, 100;
SGI::GL::writemask &SGI::GL::GREEN;
SGI::GL::color &SGI::GL::GREEN;
SGI::GL::circfi 250, 250, 100;

# Oh, I'm getting tired from typing all these 'SGI::GL::' and '()',
# let's import it all.

BEGIN { import SGI::GL @SGI::GL::EXPORT_OK }

# Alternatively we could replace both the 'use SGI::GL' and 'BEGIN...'
# lines with a single 'use SGI::GL @SGI::GL:EXPORT_OK'

writemask BLUE;
color BLUE;
circfi 200, 150, 100;
gflush;
sleep 10;
gexit;
exit 0;
