Chandra 0.5 - 7 keV
3.7 Aperture Photometry (p66 (30))
Start notes at:

= 3.9 Spectral Model Fits (p69) =
+Source observations with <150 net counts in 0.5-7 keV in ACIS
   Apply power law and black body spectral models
Blackbody: f(E) = exp(−N_H*σ_E)*A(E^2/(exp(E/kT −1)))
Power Law: f(E) = exp(−N_H*σ_E)*A*E^−Γ
N_H = equivalent hydrogen column density
σ_E = photo-electric cross-section based on Balucinska-Church & McCammon(1992) and metal abundances from Anders & Grevesse(1989)
A = model normalization at E = 1 keV
kT = blackbody temperature
Γ = power-law photon index
   The correction in Γ is approximately 0.03–0.05 for power-law spectra with a wide range of spectral indices.

= 3.10 Spectral Model Energy Fluxes =
Spectral model fits are not performed for sources with <150 net counts. However, for all sources we estimate energy fluxes using canonical absorbed power-law and blackbody spectral models.
Count rate = ∫dE R(E';E) A(E) S(E) over entire energy band
   A(E) = Effective area calibration
   R(E',E) = RMF (for HRC this is diagonal, ACIS...?)
   S(E) from integral over energy band in S'
Actual flux can be estimated from S'
Canonical power-law spectral model
   photon index Γ = 1.7 (Γ∼1.5–2.5)
!! The model flux for the best-fit parameters over the energy range 0.5–7 keV is also calculated.
!! The value chosen matches the photon index used to convert count rates to energy fluxes in the second XMM-Newton serendipitous source catalog (2XMM; Watson et al. 2008), to simplify comparison of CSC and 2XMM source fluxes.



2XMM 0.2 - 12 keV
4.6 Flux computation
Calculated for each energy band, i:
F_i = R_i/f_i
R = corrected source count rate
f = energy conversion factor ECF - depend on camera, filter, data mode, and source spectrum
   table 4 in p348
Γ = 1.7
!! Not corrected for galactic absorption along line of sight
!! 0.2-12kev