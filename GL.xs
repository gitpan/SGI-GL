#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <gl/gl.h>
#include <gl/device.h>

static int
not_here(s)
char *s;
{
    croak("%s not implemented on this architecture", s);
    return -1;
}

static double
constant(name, arg)
	char *name;
	int arg;
{
    errno = 0;
    switch (*name) {
    case 'B':
	if (strEQ(name, "BLACK"))
#ifdef BLACK
	    return BLACK;
#else
	    goto not_there;
#endif
	if (strEQ(name, "BLUE"))
#ifdef BLUE
	    return BLUE;
#else
	    goto not_there;
#endif
	break;

    case 'C':
	if (strEQ(name, "CURSORDRAW"))
#ifdef CURSORDRAW
	    return CURSORDRAW;
#else
	    goto not_there;
#endif
	break;

    case 'E':
	if (strEQ(name, "ESCKEY"))
#ifdef ESCKEY
	    return ESCKEY;
#else
	    goto not_there;
#endif
	break;

    case 'G':
	if (strnEQ(name, "GD_", 3)) {
	    if (strEQ(name, "GD_BITS_NORM_DBL_RED"))
#ifdef GD_BITS_NORM_DBL_RED
		return GD_BITS_NORM_DBL_RED;
#else
		goto not_there;
#endif
	    if (strEQ(name, "GD_BITS_NORM_ZBUFFER"))
#ifdef GD_BITS_NORM_ZBUFFER
		return GD_BITS_NORM_ZBUFFER;
#else
		goto not_there;
#endif
	    if (strEQ(name, "GD_TIMERHZ"))
#ifdef GD_TIMERHZ
		return GD_TIMERHZ;
#else
		goto not_there;
#endif
	    if (strEQ(name, "GD_XMMAX"))
#ifdef GD_XMMAX
		return GD_XMMAX;
#else
		goto not_there;
#endif
	    if (strEQ(name, "GD_XPMAX"))
#ifdef GD_XPMAX
		return GD_XPMAX;
#else
		goto not_there;
#endif
	    if (strEQ(name, "GD_YMMAX"))
#ifdef GD_YMMAX
		return GD_YMMAX;
#else
		goto not_there;
#endif
	    if (strEQ(name, "GD_YPMAX"))
#ifdef GD_YPMAX
		return GD_YPMAX;
#else
		goto not_there;
#endif
	    if (strEQ(name, "GD_ZDRAW_GEOM"))
#ifdef GD_ZDRAW_GEOM
		return GD_ZDRAW_GEOM;
#else
		goto not_there;
#endif
	    if (strEQ(name, "GD_ZDRAW_PIXELS"))
#ifdef GD_ZDRAW_PIXELS
		return GD_ZDRAW_PIXELS;
#else
		goto not_there;
#endif
	    if (strEQ(name, "GD_ZMAX"))
#ifdef GD_ZMAX
		return GD_ZMAX;
#else
		goto not_there;
#endif
	    errno = EINVAL;
	    return 0;
	} else if (strnEQ(name, "GLC_", 4)) {
	    if (strEQ(name, "GLC_OLDPOLYGON"))
#ifdef GLC_OLDPOLYGON
		return GLC_OLDPOLYGON;
#else
		goto not_there;
#endif
	    errno = EINVAL;
	    return 0;
	} else if (strEQ(name, "GREEN"))
#ifdef GREEN
	    return GREEN;
#else
	    goto not_there;
#endif
	break;

    case 'M':
	if (strEQ(name, "MVIEWING"))
#ifdef MVIEWING
	    return MVIEWING;
#else
	    goto not_there;
#endif
	break;

    case 'N':
	if (strEQ(name, "NORMALDRAW"))
#ifdef NORMALDRAW
	    return NORMALDRAW;
#else
	    goto not_there;
#endif
	break;

    case 'O':
	if (strEQ(name, "OVERDRAW"))
#ifdef OVERDRAW
	    return OVERDRAW;
#else
	    goto not_there;
#endif
	break;

    case 'P':
	if (strEQ(name, "PUPDRAW"))
#ifdef PUPDRAW
	    return PUPDRAW;
#else
	    goto not_there;
#endif
	break;

    case 'R':
	if (strEQ(name, "RED"))
#ifdef RED
	    return RED;
#else
	    goto not_there;
#endif
	else if (strEQ(name, "REDRAW"))
#ifdef REDRAW
	    return REDRAW;
#else
	    goto not_there;
#endif
	break;

    case 'S':
	if (strEQ(name, "SPACEKEY"))
#ifdef SPACEKEY
	    return SPACEKEY;
#else
	    goto not_there;
#endif
	break;

    case 'T':
	if (strnEQ(name, "TIMER", 5)) {
	    if (strEQ(name, "TIMER0"))
#ifdef TIMER0
		return TIMER0;
#else
		goto not_there;
#endif
	    else if (strEQ(name, "TIMER1"))
#ifdef TIMER1
		return TIMER1;
#else
		goto not_there;
#endif
	    else if (strEQ(name, "TIMER2"))
#ifdef TIMER2
		return TIMER2;
#else
		goto not_there;
#endif
	    else if (strEQ(name, "TIMER3"))
#ifdef TIMER3
		return TIMER3;
#else
		goto not_there;
#endif
	    errno = EINVAL;
	    return 0;
	}
	break;

    case 'U':
	if (strEQ(name, "UNDERDRAW"))
#ifdef UNDERDRAW
	    return UNDERDRAW;
#else
	    goto not_there;
#endif
	break;
    }

    errno = EINVAL;
    return 0;

not_there:
    errno = ENOENT;
    return 0;
}

MODULE = SGI::GL		PACKAGE = SGI::GL

double
constant(name,arg)
	char *		name
	int		arg

void
RGBcolor(red,green,blue)
	short		red
	short		green
	short		blue

void
RGBmode()

void
RGBwritemask(red,green,blue)
	short		red
	short		green
	short		blue

void
backbuffer(b)
	Boolean		b

void
bgnclosedline()

void
bgnline()

void
bgnpolygon()

void
circ(x,y,radius)
	Coord		x
	Coord		y
	Coord		radius

void
circf(x,y,radius)
	Coord		x
	Coord		y
	Coord		radius

void
circfi(x,y,radius)
	Icoord		x
	Icoord		y
	Icoord		radius

void
circfs(x,y,radius)
	Scoord		x
	Scoord		y
	Scoord		radius

void
circi(x,y,radius)
	Icoord		x
	Icoord		y
	Icoord		radius

void
circs(x,y,radius)
	Scoord		x
	Scoord		y
	Scoord		radius

void
clear()

void
cmode()

void
cmov(x,y,z)
	Coord		x
	Coord		y
	Coord		z

void
cmov2(x,y)
	Coord		x
	Coord		y

void
cmov2i(x,y)
	Icoord		x
	Icoord		y

void
cmov2s(x,y)
	Scoord		x
	Scoord		y

void
cmovi(x,y,z)
	Icoord		x
	Icoord		y
	Icoord		z

void
cmovs(x,y,z)
	Scoord		x
	Scoord		y
	Scoord		z

void
color(c)
	Colorindex	c

void
colorf(c)
	float		c

void
cpack(pack)
	unsigned long	pack

void
doublebuffer()

void
drawmode(mode)
	long		mode

void
endclosedline()

void
endline()

void
endpolygon()

void
foreground()

void
frontbuffer(b)
	Boolean		b

void
gRGBmask()
	PPCODE:
	{
	short redm, greenm, bluem;

	gRGBmask (&redm, &greenm, &bluem);
	EXTEND (sp, 3);
	PUSHs (sv_2mortal (newSVnv (redm)));
	PUSHs (sv_2mortal (newSVnv (greenm)));
	PUSHs (sv_2mortal (newSVnv (bluem)));
	}

void
gconfig()

long
getdrawmode()

long
getgdesc(inquiry)
	long		inquiry

long
getplanes()

void
getsize()
	PPCODE:
	{
	long x, y;

	getsize (&x, &y);
	EXTEND (sp, 2);
	PUSHs (sv_2mortal (newSVnv (x)));
	PUSHs (sv_2mortal (newSVnv (y)));
	}

long
getwritemask()

void
gexit()

void
gflush()

void
glcompat(mode,value)
	long		mode
	long		value

void
linewidth(line_width)
	int		line_width

void
lrectread(x1,y1,x2,y2)
	Screencoord	x1
	Screencoord	y1
	Screencoord	x2
	Screencoord	y2
	CODE:
	{
	SV *sv;
	long plen;
	unsigned long *parray;
	plen = (x2 - x1 + 1) * (y2 - y1 + 1);
	if (plen < 0)
		plen = -plen;
	New (0, parray, plen, unsigned long);
	lrectread (x1, y1, x2, y2, parray);
	ST(0) = sv_newmortal();
	sv_setpvn (ST(0), (char *)parray, plen * sizeof (unsigned long));
#if 0
	Safefree (parray);
#endif
	}

void
lrectwrite(x1,y1,x2,y2,...)
	Screencoord	x1
	Screencoord	y1
	Screencoord	x2
	Screencoord	y2
	CODE:
	{
	unsigned long *parray, val;
	int plen, i, freeflag = 1;
	plen = (x2 - x1 + 1) * (y2 - y1 + 1);
	if (items < 5)
		/* only 4 arguments specified, assume the fifth is
		 * a scalar '0'
		 */
		Newz (0, parray, plen, unsigned long);
	else if (SvROK (ST(4))) {
		SV *sv;
		unsigned long ul;
		sv = (SV *)SvRV (ST(4));
		if (SvPOK (sv)) {
			I32 svlen;
			freeflag = 0;
			svlen = SvCUR (sv) / sizeof (unsigned long);
			if (plen < (int) svlen)
				svlen = (I32) plen;
			else if (plen > (int) svlen) {
				SvGROW (sv, plen);
				parray = (unsigned long *)SvPV (sv, na);
				parray += svlen;
				ul = parray[-1];
				do
					*(parray++) = ul;
				while (++svlen < plen);
			}
			parray = (unsigned long *)SvPV (sv, na);
		} else {
			/* a ref to a none-string => assume array */
			AV *av;
			I32 avlen, i32;
			av = (AV *)SvRV (ST(4));
			New (0, parray, plen, unsigned long);
			avlen = av_len (av);
			if (plen < (int) avlen)
				avlen = (I32) plen;
			for (i32 = 0; i32 < avlen; ++i32) {
				sv = *av_fetch (av, i32, (I32)0);
				parray[(int) i32] = SvIV (sv);
			}
			ul = (avlen == (I32) 0) ? 0 : parray[(int) (avlen -1)];
			for (i = (int) avlen; i < plen; ++i)
				parray[i] = ul;
		}
	} else {
		int stlen;
		/* we were given the array as the tail of the list of
		 * arguments.  act pretty much the same as in the case
		 * of a refference to an array
		 */
		New (0, parray, plen, unsigned long);
		stlen = items - 4;
		if (plen < stlen)
			stlen = plen;
		for (i = 0; i < stlen; ++i)
			parray[i] = (int)SvIV (ST (i + 4));
		while (i++ < plen)
			parray[i] = parray[stlen - 1];
	}
	lrectwrite (x1, y1, x2, y2, parray);
	/* free only if it is not a ref to a string */
	if (freeflag)
		Safefree (parray);
	}

void
reshapeviewport()

void
mapcolor(i,red,green,blue)
	Colorindex	i
	short		red
	short		green
	short		blue

void
mmode(m)
	short		m

void
noborder()

void
noise(v, delta)
	Device		v
	short		delta

void
ortho(left,right,bottom,top,near,far)
	Coord		left
	Coord		right
	Coord		bottom
	Coord		top
	Coord		near
	Coord		far

void
ortho2(left,right,bottom,top)
	Coord		left
	Coord		right
	Coord		bottom
	Coord		top

void
overlay(planes)
	long		planes

void
popmatrix()

void
prefposition(x1,x2,y1,y2)
	long		x1
	long		x2
	long		y1
	long		y2

void
prefsize(x,y)
	long		x
	long		y

void
pushmatrix()

void
qdevice(dev)
	Device		dev

void
qenter(dev,val)
	Device		dev
	short		val

void
qread()
	PPCODE:
	{
	short data;
	long l;

	l = qread (&data);
	EXTEND (sp, 2);
	PUSHs (sv_2mortal (newSVnv (l)));
	PUSHs (sv_2mortal (newSVnv (data)));
	}

void
qreset()

long
qtest()

void
rectf(x1,y1,x2,y2)
	Coord		x1
	Coord		y1
	Coord		x2
	Coord		y2

void
rectread(x1,y1,x2,y2)
	Screencoord	x1
	Screencoord	y1
	Screencoord	x2
	Screencoord	y2
	CODE:
	{
	SV *sv;
	long plen;
	Colorindex *parray;
	plen = (x2 - x1 + 1) * (y2 - y1 + 1);
	if (plen < 0)
		plen = -plen;
	New (0, parray, plen, Colorindex);
	rectread (x1, y1, x2, y2, parray);
	ST(0) = sv_newmortal();
	sv_setpvn (ST(0), (char *)parray, plen * sizeof (*parray));
#if 0
	Safefree (parray);
#endif
	}

void
rectwrite(x1,y1,x2,y2,...)
	Screencoord	x1
	Screencoord	y1
	Screencoord	x2
	Screencoord	y2
	CODE:
	{
	Colorindex *parray, val;
	int plen, i, freeflag = 1;
	plen = (x2 - x1 + 1) * (y2 - y1 + 1);
	if (items < 5)
		/* only 4 arguments specified, assume the fifth is
		 * a scalar '0'
		 */
		Newz (0, parray, plen, Colorindex);
	else if (SvROK (ST(4))) {
		SV *sv;
		Colorindex c;
		sv = (SV *)SvRV (ST(4));
		if (SvPOK (sv)) {
			I32 svlen;
			freeflag = 0;
			svlen = SvCUR (sv) / sizeof (Colorindex);
			if (plen < (int) svlen)
				svlen = (I32) plen;
			else if (plen > (int) svlen) {
				SvGROW (sv, plen);
				parray = (Colorindex *)SvPV (sv, na);
				parray += svlen;
				c = parray[-1];
				do
					*(parray++) = c;
				while (++svlen < plen);
			}
			parray = (Colorindex *)SvPV (sv, na);
		} else {
			/* a ref to a none-string => assume array */
			AV *av;
			I32 avlen, i32;
			av = (AV *)SvRV (ST(4));
			New (0, parray, plen, Colorindex);
			avlen = av_len (av);
			if (plen < (int) avlen)
				avlen = (I32) plen;
			for (i32 = 0; i32 < avlen; ++i32) {
				sv = *av_fetch (av, i32, (I32)0);
				parray[(int) i32] = SvIV (sv);
			}
			c = (avlen == (I32) 0) ? 0 : parray[(int) (avlen -1)];
			for (i = (int) avlen; i < plen; ++i)
				parray[i] = c;
		}
	} else {
		int stlen;
		/* we were given the array as the tail of the list of
		 * arguments.  act pretty much the same as in the case
		 * of a refference to an array
		 */
		New (0, parray, plen, Colorindex);
		stlen = items - 4;
		if (plen < stlen)
			stlen = plen;
		for (i = 0; i < stlen; ++i)
			parray[i] = (int)SvIV (ST (i + 4));
		while (i++ < plen)
			parray[i] = parray[stlen - 1];
	}
	rectwrite (x1, y1, x2, y2, parray);
	/* free only if it is not a ref to a string */
	if (freeflag)
		Safefree (parray);
	}

void
rotate (a,axis)
	Angle		a
	char		axis

void
swapbuffers()

void
swapinterval(i)
	short		i

void
translate(x,y,z)
	Coord		x
	Coord		y
	Coord		z

void
underlay(planes)
	long		planes

void
unqdevice(dev)
	Device		dev

void
v2d(v0,v1)
	double		v0
	double		v1
	CODE:
	{
	double	v[2];
	
	v[0] = v0;
	v[1] = v1;

	v2d(v);
	}

void
v2f(v0,v1)
	float		v0
	float		v1
	CODE:
	{
	float	v[2];
	
	v[0] = v0;
	v[1] = v1;

	v2f(v);
	}

void
v2i(v0,v1)
	long		v0
	long		v1
	CODE:
	{
	long	v[2];
	
	v[0] = v0;
	v[1] = v1;

	v2i(v);
	}

void
v2s(v0,v1)
	short		v0
	short		v1
	CODE:
	{
	short	v[2];
	
	v[0] = v0;
	v[1] = v1;

	v2s(v);
	}

void
v3d(v0,v1,v2)
	double		v0
	double		v1
	double		v2
	CODE:
	{
	double	v[3];
	
	v[0] = v0;
	v[1] = v1;
	v[2] = v2;

	v3d(v);
	}

void
v3f(v0,v1,v2)
	float		v0
	float		v1
	float		v2
	CODE:
	{
	float	v[3];
	
	v[0] = v0;
	v[1] = v1;
	v[2] = v2;

	v3f(v);
	}

void
v3i(v0,v1,v2)
	long		v0
	long		v1
	long		v2
	CODE:
	{
	long	v[3];
	
	v[0] = v0;
	v[1] = v1;
	v[2] = v2;

	v3i(v);
	}

void
v3s(v0,v1,v2)
	short		v0
	short		v1
	short		v2
	CODE:
	{
	short	v[3];
	
	v[0] = v0;
	v[1] = v1;
	v[2] = v2;

	v3s(v);
	}

void
v4d(v0,v1,v2,v3)
	double		v0
	double		v1
	double		v2
	double		v3
	CODE:
	{
	double	v[4];
	
	v[0] = v0;
	v[1] = v1;
	v[2] = v2;
	v[3] = v3;

	v4d(v);
	}

void
v4f(v0,v1,v2,v3)
	float		v0
	float		v1
	float		v2
	float		v3
	CODE:
	{
	float	v[4];
	
	v[0] = v0;
	v[1] = v1;
	v[2] = v2;
	v[3] = v3;

	v4f(v);
	}

void
v4i(v0,v1,v2,v3)
	long		v0
	long		v1
	long		v2
	long		v3
	CODE:
	{
	long	v[4];
	
	v[0] = v0;
	v[1] = v1;
	v[2] = v2;
	v[3] = v3;

	v4i(v);
	}

void
v4s(v0,v1,v2,v3)
	short		v0
	short		v1
	short		v2
	short		v3
	CODE:
	{
	short	v[4];
	
	v[0] = v0;
	v[1] = v1;
	v[2] = v2;
	v[3] = v3;

	v4s(v);
	}

long
winopen(name="")
	char *		name
	CODE:
	{
	long	l;

	ST(0) = sv_newmortal();
	if ((l = winopen (name)) > -1) {
		sv_setnv (ST(0), l);
	} else {
		ST(0) = &sv_undef;
	}
	}

void
wmpack(pack)
	unsigned long	pack

void
writemask(wtm)
	Colorindex	wtm

void
zbuffer(b)
	Boolean		b

void
zclear()

void
zdraw(b)
	Boolean		b
