Adapted from /su13/maserlist/crossmatch.txt V8


=== V1.0 === Spectroscopic Crossmatch mcfxs1v0
select
m.name mname, m.ra mra, m.dec mdec, m.velo, s.specObjID, s.ra sra, s.dec sdec, s.z, s.class, s.subclass
from
MyDB..mctrlfilt m, SpecObjAll s
where
(class = 'galaxy' or class = 'qso')
and ((m.ra-s.ra)*cos(m.dec))*((m.ra-s.ra)*cos(m.dec)) + (s.dec-m.dec)*(s.dec-m.dec) < 0.000008

== V1.1 == Spectroscopic Crossmatch mcfxs1v1
select
m.name mname, m.ra mra, m.dec mdec, m.velo, s.specObjID, s.ra sra, s.dec sdec, s.z, s.class, s.subclass
from
MyDB..masercontrol m, SpecObjAll s
where
(class = 'galaxy' or class = 'qso')
and ((m.ra-s.ra)*cos(m.dec))*((m.ra-s.ra)*cos(m.dec)) + (s.dec-m.dec)*(s.dec-m.dec) < 0.000008

== V1.2 == Spectroscopic Crossmatch ControlSpecDR9
select
m.name mname, m.ra mra, m.dec mdec, m.velo, s.specObjID, s.ra sra, s.dec sdec, s.z, s.class, s.subclass
from
MyDB..Control m, SpecObjAll s
where
(class = 'galaxy' or class = 'qso')
and ((m.ra-s.ra)*cos(m.dec))*((m.ra-s.ra)*cos(m.dec)) + (s.dec-m.dec)*(s.dec-m.dec) < 0.000008


=== V2.0 === Photometric Crossmatch mcfxp2v0
select
m.name mname, m.ra mra, m.dec mdec, m.velo, p.objid, p.ra pra, p.dec pdec, p.z, p.type
from
MyDB..mctrlfilt m, photoobjall p
where
type = 3
and ((m.ra-p.ra)*cos(m.dec))*((m.ra-p.ra)*cos(m.dec)) + (p.dec-m.dec)*(p.dec-m.dec) < 0.000008