% The SVG figures for "cpp-object-model.md".
outputformat := "svg";
outputtemplate := "%j-%c.svg";
defaultscale := 16pt/fontsize(defaultfont);

def drawtext(expr p, r) =
  begingroup
    save z, w;
    pair z[];
    numeric w;
    z1 = center p;
    w := xpart(urcorner p - ulcorner p);
    z2 := z1 - (w/2, 0);
    draw p shifted (r-z2);
  endgroup;
enddef;

def drawtotext(expr p, r) =
  drawtext(p, r+(1cm,0));
  drawarrow r--r+(.8cm,0);
enddef;

vardef width(expr p) =
  xpart(urcorner p - ulcorner p)
enddef;

input boxes;
beginfig(1)
  boxjoin(a.sw=b.nw; a.se=b.ne);
  boxit.a(btex \strut \_vptr\_A etex);
  boxit.b(btex \strut a etex);
  drawboxed(a,b);

  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.c(btex \strut RTTI ptr etex);
  boxit.d();
  a.e + (1cm, 0) = c.sw;
  drawboxed(c, d);
  drawarrow a.e--c.sw;

  boxjoin();
  boxit.e(btex 0 etex);
  e.sw=c.nw;
  e.se=c.ne;
  e.n-e.s=c.n-c.s;
  drawboxed(e);
  
  picture p[];
  p1 = btex inversion of offset of \_vptr\_A etex;
  p2 = btex typeinfo object for A etex;
  p3 = btex A::foo() etex;
  drawtext(p1, e.e+(.2cm,0));
  drawtext(p2, c.e+(1cm,0));
  drawtext(p3, d.e+(1cm,0));
  drawarrow c.e--c.e+(.8cm,0);
  drawarrow d.e--d.e+(.8cm,0);
endfig;

beginfig(2);
  boxjoin(a.sw=b.nw; a.se=b.ne);
  boxit.a(btex \strut \_vptr\_A etex);
  boxit.b(btex \strut a etex);
  drawboxed(a,b);

  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.c(btex \strut RTTI ptr etex);
  boxit.d();
  a.e + (1cm, 0) = c.sw;
  drawboxed(c, d);
  drawarrow a.e--c.sw;

  boxjoin();
  boxit.e(btex 0 etex);
  e.sw=c.nw;
  e.se=c.ne;
  e.n-e.s=c.n-c.s;
  drawboxed(e);
  
  picture p[];
  p1 = btex inversion of offset of \_vptr\_A etex;
  p2 = btex typeinfo object for A etex;
  p3 = btex A::foo() etex;
  drawtext(p1, e.e+(.2cm,0));
  drawtext(p2, c.e+(1cm,0));
  drawtext(p3, d.e+(1cm,0));
  drawarrow c.e--c.e+(.8cm,0);
  drawarrow d.e--d.e+(.8cm,0);
endfig;

beginfig(3);
  boxjoin(a.sw=b.nw; a.se=b.ne);
  boxit.a(btex \strut \_vptr\_B etex);
  boxit.b(btex \strut a etex);
  boxit.c(btex \strut b etex);
  drawboxed(a,b,c);

  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.va(btex \strut RTTI ptr etex);
  boxit.vb(); boxit.vc();
  a.e + (1cm, 0) = va.sw;
  drawboxed(va, vb, vc);
  drawarrow a.e--va.sw;

  boxjoin();
  boxit.vd(btex 0 etex);
  vd.sw=va.nw;
  vd.se=va.ne;
  vd.n-vd.s=va.n-va.s;
  drawboxed(vd);
  
  picture p[];
  p1 = btex inversion of offset of \_vptr etex;
  p2 = btex typeinfo object for B etex;
  p3 = btex A::foo() etex;
  p4 = btex B::bar() etex;
  drawtext(p1, vd.e+(.2cm,0));
  drawtotext(p2, va.e);
  drawtotext(p3, vb.e);
  drawtotext(p4, vc.e);
endfig;

beginfig(4);
    boxjoin(a.sw=b.nw; a.se=b.ne);
  boxit.a(btex \strut \_vptr\_A etex);
  boxit.b(btex \strut a etex);
  drawboxed(a,b);

  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.c(btex \strut RTTI ptr etex);
  boxit.d();
  a.e + (1cm, 0) = c.sw;
  drawboxed(c, d);
  drawarrow a.e--c.sw;

  boxjoin();
  boxit.e(btex 0 etex);
  e.sw=c.nw;
  e.se=c.ne;
  e.n-e.s=c.n-c.s;
  drawboxed(e);

  picture p[];
  p1 = btex inversion of offset of \_vptr\_A etex;
  p2 = btex typeinfo object for A etex;
  p3 = btex A::foo() etex;
  drawtext(p1, e.e+(.2cm,0));
  drawtext(p2, c.e+(1cm,0));
  drawtext(p3, d.e+(1cm,0));
  drawarrow c.e--c.e+(.8cm,0);
  drawarrow d.e--d.e+(.8cm,0);
endfig;

beginfig(5);
  boxjoin(a.sw=b.nw; a.se=b.ne);
  boxit.a(btex \strut \_vptr\_B etex);
  boxit.b(btex \strut b etex);
  drawboxed(a,b);

  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.c(btex \strut RTTI ptr etex);
  boxit.d();
  a.e + (1cm, 0) = c.sw;
  drawboxed(c, d);
  drawarrow a.e--c.sw;

  boxjoin();
  boxit.e(btex 0 etex);
  e.sw=c.nw;
  e.se=c.ne;
  e.n-e.s=c.n-c.s;
  drawboxed(e);

  picture p[];
  p1 = btex inversion of offset of \_vptr\_B etex;
  p2 = btex typeinfo object for B etex;
  p3 = btex B::bar() etex;
  drawtext(p1, e.e+(.2cm,0));
  drawtext(p2, c.e+(1cm,0));
  drawtext(p3, d.e+(1cm,0));
  drawarrow c.e--c.e+(.8cm,0);
  drawarrow d.e--d.e+(.8cm,0);
endfig;

beginfig(6);
  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.vpa(btex \strut \_vptr\_A etex);
  boxit.a(btex \strut a etex);
  boxit.vpb(btex \strut \_vptr\_B etex);
  boxit.b(btex b etex);
  boxit.c(btex c etex);
  drawboxed(vpa, a, vpb, b, c);

  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.vb(btex \strut RTTI ptr etex);
  vb.sw = vpa.e+(1cm,0);
  boxit.vc(); boxit.vd();
  boxit.ve(btex $-8$ etex);
  boxit.vf(btex \strut RTTI ptr etex);
  boxit.vg();
  drawboxed(vb, vc, vd, ve, vf, vg);
  drawarrow vpa.e--vb.sw;
  drawarrow vpb.e{right}..{right}vf.sw;
  boxjoin();
  boxit.va(btex $0$ etex);
  va.sw = vb.nw; va.se = vb.ne;
  va.n-va.s = vb.n-vb.s;
  drawboxed(va);

  picture p[];
  p1 = btex inversion of offset of \_vptr\_A etex;
  p2 = btex typeinfo object for C etex;
  p3 = btex A::foo(), inherited from class A etex;
  p4 = btex C::fun(), added by class C etex;
  p5 = btex inversion of offset of \_vptr\_B in C object etex;
  p6 = btex typeinfo object for C etex;
  p7 = btex B::bar() etex;
  drawtext(p1, va.e+(.2cm,0));
  drawtotext(p2, vb.e);
  drawtotext(p3, vc.e);
  drawtotext(p4, vd.e);
  drawtext(p5, ve.e+(.2cm,0));
  drawtotext(p6, vf.e);
  drawtotext(p7, vg.e);
endfig;

beginfig(7);
  interim defaultdy := 4bp;
  boxit.a(btex a etex);
  a.e-a.w = (2cm, whatever);
  drawboxed(a);
endfig;

beginfig(8);
  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.d1(btex \_vptr\_B etex);
  boxit.d2(btex b etex);
  drawboxed(d1, d2);

  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.v2(btex RTTI ptr etex);
  v2.sw = d1.e+(1cm,0);
  boxit.v3();
  drawboxed(v2, v3);
  drawarrow d1.e--v2.sw;

  boxjoin();
  boxit.v1(btex 0 etex);
  v1.sw = v2.nw; v1.se = v2.ne;
  v1.n-v1.s = v2.n-v2.s;
  drawboxed(v1);

  picture p[];
  p1 = btex inversion of offset of \_vptr\_B etex;
  p2 = btex typeinfo object of B etex;
  p3 = btex B::bar etex;
  drawtext(p1, v1.e+(.2cm,0));
  drawtotext(p2, v2.e);
  drawtotext(p3, v3.e);
endfig;

beginfig(9);
  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.d1(btex \_vptr\_B etex);
  boxit.d2(btex b etex);
  boxit.d3(btex a etex);
  boxit.d4(btex c etex);
  drawboxed(d1, d2, d3, d4);

  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.v2(btex RTTI ptr etex);
  v2.sw = d1.e+(1cm,0);
  boxit.v3(); boxit.v4();
  drawboxed(v2, v3, v4);
  drawarrow d1.e--v2.sw;

  boxjoin();
  boxit.v1(btex 0 etex);
  v1.sw = v2.nw; v1.se = v2.ne; v1.n-v1.s = v2.n-v2.s;
  drawboxed(v1);

  picture p[];
  p1 = btex inversion of offset of \_vptr\_B etex;
  p2 = btex typeinfo object for C etex;
  p3 = btex B::bar() etex;
  p4 = btex C::foo() etex;
  drawtext(p1, v1.e+(.2cm,0));
  drawtotext(p2, v2.e);
  drawtotext(p3, v3.e);
  drawtotext(p4, v4.e);
endfig;

beginfig(10);
  numeric w;
  w := width(btex RTTI ptr etex);

  interim defaultdy := 7bp;
  boxjoin(a.sw=b.nw; a.se=b.ne);
  boxit.adj1(); adj1.e-adj1.w = (w+2*defaultdx, whatever);
  boxit.adj2(btex $\vdots$ etex);
  boxit.adj3();

  boxit.vb1();
  boxit.vb2(btex $\vdots$ etex);
  boxit.vb3();

  boxit.off();
  boxit.r(btex RTTI ptr etex);

  boxit.vf1();
  boxit.vf2(btex $\vdots$ etex);
  boxit.vf3();
  drawboxed(adj1, adj2, adj3, vb1, vb2, vb3,
      off, r, vf1, vf2, vf3);

  draw btex $\rbrace$ etex xscaled 1.5 yscaled 5.5
    shifted (adj2.se+(0,1pt));
  draw btex $\rbrace$ etex xscaled 1.5 yscaled 5.5
    shifted (vb2.se+(0,1pt));
  draw btex $\rbrace$ etex xscaled 1.5 yscaled 5.5
    shifted (vf2.se+(0,1pt));

  picture p[];
  p1 = btex adjustment value table for virtual thunks etex;
  p2 = btex virtual base classes offsets etex;
  p3 = btex inversion of offset of the virtual pointer etex;
  p4 = btex typeinfo object etex;
  p5 = btex virtual function table slots etex;
  drawtext(p1, adj2.e+(.5cm, 0));
  drawtext(p2, vb2.e+(.5cm, 0));
  drawtext(p3, off.e+(.2cm,0));
  drawtotext(p4, r.e);
  drawtext(p5, vf2.e+(.5cm,0));
endfig;

beginfig(11);
  boxjoin(a.sw=b.nw; a.se=b.ne);
  boxit.a(btex \strut \_vptr\_A etex);
  boxit.b(btex \strut a etex);
  drawboxed(a,b);

  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.c(btex \strut RTTI ptr etex);
  boxit.d();
  a.e + (1cm, 0) = c.sw;
  drawboxed(c, d);
  drawarrow a.e--c.sw;

  boxjoin();
  boxit.e(btex 0 etex);
  e.sw=c.nw;
  e.se=c.ne;
  e.n-e.s=c.n-c.s;
  drawboxed(e);
  
  picture p[];
  p1 = btex inversion of offset of \_vptr\_A etex;
  p2 = btex typeinfo object for A etex;
  p3 = btex A::foo() etex;
  drawtext(p1, e.e+(.2cm,0));
  drawtext(p2, c.e+(1cm,0));
  drawtext(p3, d.e+(1cm,0));
  drawarrow c.e--c.e+(.8cm,0);
  drawarrow d.e--d.e+(.8cm,0);
endfig;

beginfig(12);
  boxjoin(a.sw=b.nw; a.se=b.ne);
  boxit.a(btex \strut \_vptr\_B etex);
  boxit.b(btex \strut a etex);
  drawboxed(a,b);

  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.va(btex \strut RTTI ptr etex);
  boxit.vb(); boxit.vc();
  a.e + (1cm, 0) = va.sw;
  drawboxed(va, vb, vc);
  drawarrow a.e--va.sw;

  boxjoin();
  boxit.vd(btex 0 etex);
  vd.sw=va.nw;
  vd.se=va.ne;
  vd.n-vd.s=va.n-va.s;
  drawboxed(vd);
  
  picture p[];
  p1 = btex inversion of offset of \_vptr etex;
  p2 = btex typeinfo object for B etex;
  p3 = btex B::bar() etex;
  p4 = btex B::fun() etex;
  drawtext(p1, vd.e+(.2cm,0));
  drawtotext(p2, va.e);
  drawtotext(p3, vb.e);
  drawtotext(p4, vc.e);
endfig;

beginfig(13);
  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.vpa(btex \strut \_vptr\_A etex);
  boxit.a(btex \strut a etex);
  boxit.c(btex c etex);
  boxit.vpb(btex \strut \_vptr\_B etex);
  boxit.b(btex b etex);
  drawboxed(vpa, a, c, vpb, b);

  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.v3(btex \strut RTTI ptr etex);
  v3.sw = vpa.e+(1.5cm,0);
  boxit.v4(); boxit.v5();
  boxit.v6(btex $-12$ etex);
  boxit.v7(btex $0$ etex);
  boxit.v8(btex $-12$ etex);
  boxit.v9(btex \strut RTTI ptr etex);
  boxit.v10(); boxit.v11();
  drawboxed(v3, v4, v5, v6, v7, v8, v9, v10, v11);
  drawarrow vpa.e--v3.sw;
  drawarrow vpb.e{right}..1/2[vpb.e,v9.sw]{down}..{right}v9.sw;

  boxjoin(a.nw=b.sw; a.ne=b.se; a.n-a.s=b.n-b.s);
  boxit.v2(btex $0$ etex);
  v2.sw = v3.nw; v2.se = v3.ne;
  v2.n-v2.s = v3.n-v3.s;
  boxit.v1(btex $12$ etex);
  drawboxed(v1, v2);

  picture p[];
  p1 = btex offset of base class B etex;
  p2 = btex inversion of offset of \_vptr\_A etex;
  p3 = btex typeinfo object for C etex;
  p4 = btex A::foo() etex;
  p5 = btex C::fun() etex;
  p6 = btex adjustment value for virtual thunk to C::fun() etex;
  p7 = btex adjustment value for B::bar() etex;
  p8 = btex inversion of offset of \_vptr\_B etex;
  p9 = btex typeinfo object for C etex;
  p10 = btex B::bar() etex;
  p11 = btex virtual thunk to C::fun() etex;
  drawtext(p1, v1.e+(.2cm,0));
  drawtext(p2, v2.e+(.2cm,0));
  drawtotext(p3, v3.e);
  drawtotext(p4, v4.e);
  drawtotext(p5, v5.e);
  drawtext(p6, v6.e+(.2cm,0));
  drawtext(p7, v7.e+(.2cm,0));
  drawtext(p8, v8.e+(.2cm, 0));
  drawtotext(p9, v9.e);
  drawtotext(p10, v10.e);
  drawtotext(p11, v11.e);

  label.lft(btex $-4$ etex, v6.w);
  label.lft(btex $-3$ etex, v7.w);
  label.lft(btex $-2$ etex, v8.w);
  label.lft(btex $-1$ etex, v9.w);
  label.lft(btex $0$ etex, v10.w);
  label.lft(btex $1$ etex, v11.w);
endfig;

beginfig(14);
  boxjoin(a.sw=b.nw; a.se=b.ne);
  boxit.a(btex \strut \_vptr\_A etex);
  boxit.b(btex \strut a etex);
  drawboxed(a,b);

  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.c(btex \strut RTTI ptr etex);
  boxit.d();
  a.e + (1cm, 0) = c.sw;
  drawboxed(c, d);
  drawarrow a.e--c.sw;

  boxjoin();
  boxit.e(btex 0 etex);
  e.sw=c.nw;
  e.se=c.ne;
  e.n-e.s=c.n-c.s;
  drawboxed(e);
  
  picture p[];
  p1 = btex inversion of offset of \_vptr\_A etex;
  p2 = btex typeinfo object for A etex;
  p3 = btex A::foo() etex;
  drawtext(p1, e.e+(.2cm,0));
  drawtext(p2, c.e+(1cm,0));
  drawtext(p3, d.e+(1cm,0));
  drawarrow c.e--c.e+(.8cm,0);
  drawarrow d.e--d.e+(.8cm,0);
endfig;

beginfig(15);
  boxjoin(a.sw=b.nw; a.se=b.ne);
  boxit.a(btex \strut \_vptr\_B etex);
  boxit.b(btex \strut b etex);
  drawboxed(a,b);

  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.va(btex \strut RTTI ptr etex);
  boxit.vb();
  a.e + (1cm, 0) = va.sw;
  drawboxed(va, vb);
  drawarrow a.e--va.sw;

  boxjoin();
  boxit.vd(btex 0 etex);
  vd.sw=va.nw;
  vd.se=va.ne;
  vd.n-vd.s=va.n-va.s;
  drawboxed(vd);
  
  picture p[];
  p1 = btex inversion of offset of \_vptr etex;
  p2 = btex typeinfo object for B etex;
  p3 = btex B::foo() etex;
  drawtext(p1, vd.e+(.2cm,0));
  drawtotext(p2, va.e);
  drawtotext(p3, vb.e);
endfig;

beginfig(16);
  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.vpa(btex \strut \_vptr\_A etex);
  boxit.a(btex \strut a etex);
  boxit.c(btex c etex);
  boxit.vpb(btex \strut \_vptr\_B etex);
  boxit.b(btex b etex);
  drawboxed(vpa, a, c, vpb, b);

  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.vb(btex \strut RTTI ptr etex);
  vb.sw = vpa.e+(1cm,0);
  boxit.vc(); boxit.vd();
  boxit.ve(btex $-8$ etex);
  boxit.vf(btex \strut RTTI ptr etex);
  boxit.vg();
  drawboxed(vb, vc, vd, ve, vf, vg);
  drawarrow vpa.e--vb.sw;
  drawarrow vpb.e{right}..1/2[vpb.e,vf.sw]{down}..{right}vf.sw;
  boxjoin();
  boxit.va(btex $0$ etex);
  va.sw = vb.nw; va.se = vb.ne;
  va.n-va.s = vb.n-vb.s;
  drawboxed(va);

  picture p[];
  p1 = btex inversion of offset of \_vptr\_A etex;
  p2 = btex typeinfo object for C etex;
  p3 = btex C::foo(), overriding A::foo() etex;
  p4 = btex C::bar(), overriding B::bar() etex;
  p5 = btex inversion of offset of \_vptr\_B in C object etex;
  p6 = btex typeinfo object for C etex;
  p7 = btex non-virtual thunk to C::fun(), adjustment required etex;
  drawtext(p1, va.e+(.2cm,0));
  drawtotext(p2, vb.e);
  drawtotext(p3, vc.e);
  drawtotext(p4, vd.e);
  drawtext(p5, ve.e+(.2cm,0));
  drawtotext(p6, vf.e);
  drawtotext(p7, vg.e);
endfig;

beginfig(17);
  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.vpa(btex \strut \_vptr\_A etex);
  boxit.a(btex \strut a etex);
  boxit.vpb(btex \strut \_vptr\_B etex);
  boxit.b(btex b etex);
  boxit.c(btex c etex);
  drawboxed(vpa, a, vpb, b, c);

  boxjoin(a.sw=b.nw; a.se=b.ne; a.n-a.s=b.n-b.s);
  boxit.vb(btex \strut RTTI ptr etex);
  vb.sw = vpa.e+(1cm,0);
  boxit.vc(); boxit.vd();
  boxit.ve(btex $-12$ etex);
  boxit.vf(btex $-12$ etex);
  boxit.vg(btex \strut RTTI ptr etex);
  boxit.vh();
  drawboxed(vb, vc, vd, ve, vf, vg, vh);
  drawarrow vpa.e--vb.sw;
  drawarrow vpb.e{right}..{right}vg.sw;
  boxjoin();
  boxit.va(btex $0$ etex);
  va.sw = vb.nw; va.se = vb.ne;
  va.n-va.s = vb.n-vb.s;
  drawboxed(va);

  picture p[];
  p1 = btex inversion of offset of \_vptr\_A etex;
  p2 = btex typeinfo object for C etex;
  p3 = btex C::foo(), overriding A::foo() etex;
  p4 = btex C::bar(), overriding B::bar() etex;
  p5 = btex adjustment value for thunk to C::fun() etex;
  p6 = btex inversion of offset of \_vptr\_B in C object etex;
  p7 = btex typeinfo object for C etex;
  p8 = btex virtual thunk to C::fun() etex;
  drawtext(p1, va.e+(.2cm,0));
  drawtotext(p2, vb.e);
  drawtotext(p3, vc.e);
  drawtotext(p4, vd.e);
  drawtext(p5, ve.e+(.2cm,0));
  drawtext(p6, vf.e+(.2cm,0));
  drawtotext(p7, vg.e);
  drawtotext(p8, vh.e);
endfig;

end;
