package SGI::GL;

require Exporter;
require AutoLoader;
require DynaLoader;
@ISA = qw(Exporter AutoLoader DynaLoader);
@EXPORT_OK = qw(
	BLUE
	CURSORDRAW
	ESCKEY
	GD_BITS_NORM_DBL_RED
	GD_BITS_NORM_ZBUFFER
	GD_TIMERHZ
	GD_XMMAX
	GD_XPMAX
	GD_YMMAX
	GD_YPMAX
	GD_ZDRAW_GEOM
	GD_ZDRAW_PIXELS
	GD_ZMAX
	GREEN
	MVIEWING
	NORMALDRAW
	OVERDRAW
	PUPDRAW
	RED
	REDRAW
	SPACEKEY
	TIMER0
	TIMER1
	TIMER2
	TIMER3
	UNDERDRAW

	RGBcolor
	RGBmode
	RGBwritemask
	backbuffer
	bgnclosedline
	bgnline
	bgnpolygon
	circ
	circf
	circfi
	circfs
	circi
	circs
	clear
	cmode
	cmov
	cmov2
	cmov2i
	cmov2s
	cmovi
	cmovs
	color
	colorf
	cpack
	doublebuffer
	drawmode
	endclosedline
	endline
	endpolygon
	foreground
	frontbuffer
	gRGBmask
	gconfig
	getdrawmode
	getgdesc
	getsize
	getwritemask
	gexit
	gflush
	glcompat
	linewidth
	lrectread
	lrectwrite
	mapcolor
	mmode
	noborder
	noise
	ortho
	ortho2
	overlay
	popmatrix
	prefposition
	prefsize
	pushmatrix
	qdevice
	qenter
	qread
	qreset
	qtest
	rectf
	rectread
	rectwrite
	reshapeviewport
	rotate
	swapbuffers
	swapinterval
	translate
	underlay
	unqdevice
	v2d
	v2f
	v2i
	v2s
	v3d
	v3f
	v3i
	v3s
	v4d
	v4f
	v4i
	v4s
	winopen
	wmpack
	writemask
	zbuffer
	zclear
	zdraw
);

sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.  If a constant is not found then control is passed
    # to the AUTOLOAD in AutoLoader.

    # NOTE: THIS AUTOLOAD FUNCTION IS FLAWED (but is the best we can do for now).
    # Avoid old-style ``&CONST'' usage. Either remove the ``&'' or add ``()''.
    if (@_ > 0) {
	$AutoLoader::AUTOLOAD = $AUTOLOAD;
	goto &AutoLoader::AUTOLOAD;
    }
    local($constname);
    ($constname = $AUTOLOAD) =~ s/.*:://;
    $val = constant($constname, @_ ? $_[0] : 0);
    if ($! != 0) {
	if ($! =~ /Invalid/) {
	    $AutoLoader::AUTOLOAD = $AUTOLOAD;
	    goto &AutoLoader::AUTOLOAD;
	}
	else {
	    ($pack,$file,$line) = caller;
	    die "Your vendor has not defined SGI::GL macro $constname, used at $file line $line.
";
	}
    }
    eval "sub $AUTOLOAD { $val }";
    goto &$AUTOLOAD;
}

#sub AUTOLOAD {
#    if (@_ > 1) {
#	$AutoLoader::AUTOLOAD = $AUTOLOAD;
#	goto &AutoLoader::AUTOLOAD;
#    }
#    local($constname);
#    ($constname = $AUTOLOAD) =~ s/.*:://;
#    $val = constant($constname, @_ ? $_[0] : 0);
#    if ($! != 0) {
#	if ($! =~ /Invalid/) {
#	    $AutoLoader::AUTOLOAD = $AUTOLOAD;
#	    goto &AutoLoader::AUTOLOAD;
#	}
#	else {
#	    ($pack,$file,$line) = caller;
#	    die "Your vendor has not defined SGI::GL macro $constname, used at $file line $line.
#";
#	}
#    }
#    eval "sub $AUTOLOAD { $val }";
#    goto &$AUTOLOAD;
#}

bootstrap SGI::GL;

# Preloaded methods go here.  Autoload methods go after __END__, and are
# processed by the autosplit program.

1;
__END__
