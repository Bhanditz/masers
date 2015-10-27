V1-V7 see /sp13/crossmatch.txt


=== V8 === Spectroscopic Crossmatch xmatch8
select
m.name mname, m.ra mra, m.dec mdec, m.vsys, s.specObjID, s.ra sra, s.dec sdec, s.z, s.class, s.subclass
from
MyDB..maserlist2012 m, SpecObjAll s
where
(class = 'galaxy' or class = 'qso')
and ((m.ra-s.ra)*cos(m.dec))*((m.ra-s.ra)*cos(m.dec)) + (s.dec-m.dec)*(s.dec-m.dec) < 0.000008

=== V8.1 === Spectroscopic Crossmatch > MaserSpec
select
m.name mname, m.ra mra, m.dec mdec, m.vsys, s.specObjID, s.ra sra, s.dec sdec, s.z, s.class, s.subclass
from
MyDB..Masers m, SpecObjAll s
where
(class = 'galaxy' or class = 'qso')
and ((m.ra-s.ra)*cos(m.dec))*((m.ra-s.ra)*cos(m.dec)) + (s.dec-m.dec)*(s.dec-m.dec) < 0.000008


=== V9.0 === Photometric crossmatch maserxp9-0
select
m.name mname, m.ra mra, m.dec mdec, m.vsys, p.objid, p.ra pra, p.dec pdec, p.z, p.type
from
MyDB..maserlist2012 m, photoobjall p
where
type = 3
and ((m.ra-p.ra)*cos(m.dec))*((m.ra-p.ra)*cos(m.dec)) + (p.dec-m.dec)*(p.dec-m.dec) < 0.000008
