-- Seed Manufacturers (real NZ water supply manufacturers)
INSERT INTO MANUFACTURERS (Name, Website_URL) VALUES
('Georg Fisher Piping Systems Ltd', 'https://www.gfps.com'),
('Hansen Products NZ Ltd', 'https://www.hansen.co.nz'),
('Philmac Pty Ltd', 'https://www.philmac.com.au'),
('Plasson Ltd', 'https://www.plasson.com'),
('Iplex Pipelines NZ Ltd', 'https://www.iplex.co.nz'),
('RX Plastics Ltd', 'https://www.rxplastics.co.nz'),
('Elysee Irrigation Ltd', 'https://www.elysee.co.nz'),
('Irritec SPA', 'https://www.irritec.com'),
('Radius Systems Ltd', 'https://www.radiussystems.com'),
('SAB Spa', 'https://www.sab-spa.com');

-- Seed Products (real Watercare approved materials)
INSERT INTO PRODUCTS (Name, Manufacturer_ID, Status, Expiry_Date, Limitations, Image_URL) VALUES

-- PE Pipes
('Blueline PE80 Pipe', 5, 'APPROVED', '2024-02-03', 'Certified to AS/NZS 4020. DN110 shall only be used for hydrant risers. End caps to be retained on pipe until installation. Blue jacket or minimum 4 stripes no darker than RAL 5012. PE80b PN12.5 SDR11 or PN16 SDR9. Approved sizes: DN20, DN25, DN32, DN50, DN63.', NULL),
('Blackline PE100 Pipe', 5, 'APPROVED', '2024-02-03', 'Certified to AS/NZS 4020. End caps to be retained on pipe until installation. Blue jacket or minimum 4 stripes no lighter than RAL 5005. PE100 PN12.5 SDR13.6 or PN16 SDR11. Approved sizes: DN110, DN125, DN180, DN250, DN355, DN450, DN560, DN710.', NULL),
('1200 Series PE80 Pipe', 6, 'APPROVED', '2024-03-18', 'Certified to AS/NZS 4020. PE80b material to AS/NZS 4131. End caps to be retained until installation. Approved sizes: DN20, DN25, DN32, DN50, DN63.', NULL),
('1210 Series PE100 Pipe', 6, 'APPROVED', '2024-03-18', 'Certified to AS/NZS 4020. PE100 material to AS/NZS 4131. Approved sizes: DN110 and above. DN110 for hydrant risers only.', NULL),
('EnviroPressure PE Pipe', 5, 'EXPIRED', '2024-02-21', 'Previously approved. Certification lapsed. Reapplication required with updated AS/NZS 4020 compliance documentation.', NULL),

-- PE Barrier Pipe
('Puriton Barrier Pipe', 9, 'APPROVED', '2024-04-12', 'PE80b with Aluminium Foil Layer. Certified to BS 8588 and AS/NZS 4020. Pipe shall be blue no lighter than RAL 5005 and no darker than RAL 5012. Minimum 4 longitudinal brown stripes equidistant around circumference. PN12.5 or PN16. Approved sizes: DN25, DN32, DN63. Pipe manufacturers to specify compatible fittings.', NULL),

-- Compression Couplers
('+GF+ iJoint Compression Coupler', 1, 'APPROVED', '2024-05-27', 'Certified to AS/NZS 4020 and AS/NZS 4129. Body: PP or POM. Seals: EPDM or Nitrile Rubber. End configurations: Mechanical socket-Mechanical socket. PP/POM support liner to be inserted in pipe before installing fitting. PN16. Approved sizes: DN20, DN25, DN32, DN50, DN63.', NULL),
('EasyFit MD Compression Coupler', 2, 'EXPIRED', '2023-07-29', 'Previously certified to AS/NZS 4129. Approval expired. ISO 9001 certification renewal required before reapplication.', NULL),
('Plasson Compression Coupler', 4, 'EXPIRED', NULL, 'Approval expired. No current certification on file. Contact manufacturer for reapplication status.', NULL),
('Connecto Plus Ultra Coupler', 8, 'APPROVED', '2024-04-08', 'Certified to AS/NZS 4129. Body: PP or POM. PN16. Approved sizes: DN20, DN25, DN32, DN50, DN63. PP/POM support liner required. Stainless steel support liner to be inserted in DN125 and larger pipes.', NULL),
('Epsilon Series Coupler', 7, 'APPROVED', '2025-01-17', 'Certified to AS/NZS 4129. Body: PP or POM. Seals: EPDM or Nitrile Rubber. PN16. Approved sizes: DN20, DN25, DN32, DN50, DN63. PP/POM support liner to be inserted in pipe before installing fitting.', NULL),

-- Compression End Caps
('+GF+ iJoint Compression End Cap', 1, 'APPROVED', '2026-10-13', 'Certified to AS/NZS 4020 and AS/NZS 4129. Body: PP or POM. Seals: EPDM or Nitrile Rubber. End Configuration: Mechanical Socket. PP/POM support liner to be inserted in pipe before installing fitting. PN16. Approved sizes: DN20, DN25, DN32, DN50, DN63.', NULL),
('Philmac Compression End Cap', 3, 'APPROVED', '2026-06-13', 'Certified to AS/NZS 4020 and AS/NZS 4129. Body: PP or POM. PN16. Approved sizes: DN20, DN25, DN32, DN50, DN63. Support liner required before installation.', NULL),
('Epsilon Series End Cap', 7, 'PENDING', NULL, 'Application submitted. Awaiting AS/NZS 4020 drinking water certification review. Expected approval Q2 2026.', NULL),

-- Electrofusion Tees
('+GF+ Electrofusion Tee', 1, 'APPROVED', '2024-05-27', 'Certified to AS/NZS 4129. PE100 to AS/NZS 4131. PN16. Approved sizes: DN20, DN25, DN32, DN40, DN50, DN63. End configurations: EF socket-EF socket-EF socket. Refer to PE Manufacturers Actions memo.', NULL),
('Plasson Electrofusion Tee', 4, 'APPROVED', '2024-03-02', 'Certified to AS/NZS 4129. PE100 material. PN16. Approved sizes: DN20, DN25, DN32, DN40, DN50, DN63. Manufacturer nominated fitting tools must be used.', NULL),
('Plastitalia Electrofusion Tee', 4, 'EXPIRED', '2023-11-02', 'Certification lapsed. Was approved for DN20-DN63 sizes. Reapplication with updated ISO 9001 and AS/NZS 4129 compliance required.', NULL);