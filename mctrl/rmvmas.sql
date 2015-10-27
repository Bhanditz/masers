=== V1 ===
select
c.name, c.ra, c.dec, c.velo, m.name
from
maserlist2012 m, mctrl c
where
m.name != c.name


=== V2 ===
select
c.name, c.ra, c.dec, c.velo, m.name
from
maserlist2012 m, mctrl c
where
m.name = c.name

=== V3 ===
select
m.name mname, m.ra mra, m.dec mdec, m.vsys
from
maserlist2012 m, mctrl c
where
((m.ra-c.ra)*cos(m.dec))*((m.ra-c.ra)*cos(m.dec)) + (c.dec-m.dec)*(c.dec-m.dec) < 0.000008

=== V4 ===
select
c.name, c.ra, c.dec, c.velo, m.name
from
maserlist2012 m, mctrl c
where
m.name != c.name AND ((m.ra-c.ra)*cos(m.dec))*((m.ra-c.ra)*cos(m.dec)) + (c.dec-m.dec)*(c.dec-m.dec) < 0.000008

=== V5 ===
+++ Good version
select
c.name, c.ra, c.dec, c.velo, m.name
from
maserlist2012 m, mctrl c
where
m.name = c.name OR ((m.ra-c.ra)*cos(m.dec))*((m.ra-c.ra)*cos(m.dec)) + (c.dec-m.dec)*(c.dec-m.dec) < 0.000008

=== V6 ===
+++ Good version
select
c.name, c.ra, c.dec, c.velo
from
mctrl c
where
c.name NOT IN (Select name FROM allposname)

=== V7 ===
+++ Good version
select
c.name, c.ra, c.dec, c.velo, m.name
from
maserlist2012 m, longcrop c
where
m.name = c.name OR ((m.ra-c.ra)*cos(m.dec))*((m.ra-c.ra)*cos(m.dec)) + (c.dec-m.dec)*(c.dec-m.dec) < 0.000008

=== V8 ===
+++ Good version
select
c.name, c.ra, c.dec, c.velo, m.name
from
maserlist2012 m, longcrop c
where
m.name = c.name OR ((m.ra-c.ra)*cos(m.dec))*((m.ra-c.ra)*cos(m.dec)) + (c.dec-m.dec)*(c.dec-m.dec) < 0.01

=== V9 ===
select
c.name, c.ra, c.dec, c.velo, m.name
from
maserlist2012 m, longcrop c
where
m.name = c.name OR ((m.ra-c.ra)*cos(m.dec))*((m.ra-c.ra)*cos(m.dec)) + (c.dec-m.dec)*(c.dec-m.dec) < 100

=== V10 ===
select
c.name, c.ra, c.dec, c.velo
from
bigtest c
where
c.name NOT IN (Select name FROM longxmatch)

=== V11 ===
+++ Good version
select
c.name, c.ra, c.dec, c.velo
from
mctrl c
where
c.name NOT IN (Select name FROM controlfilter)

== V12 ==
select
c.name, c.ra, c.dec, c.velo, m.name
from
Masers m, longcrop c
where
m.name = c.name OR ((m.ra-c.ra)*cos(m.dec))*((m.ra-c.ra)*cos(m.dec)) + (c.dec-m.dec)*(c.dec-m.dec) < 0.000008

== V13 ==
select
c.name, c.ra, c.dec, c.velo
from
masercontrol c
where
c.name NOT IN (Select name FROM newlittle)