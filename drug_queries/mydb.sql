CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `mydb`;

CREATE TABLE IF NOT EXISTS `mytbl_drugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drug1` text COLLATE utf8_unicode_ci,
  `drug2` text COLLATE utf8_unicode_ci,
  `drug3` text COLLATE utf8_unicode_ci,
  `drug4` text COLLATE utf8_unicode_ci,
  `drug5` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

TRUNCATE mydb.mytbl_drugs;

INSERT INTO `mytbl_drugs` (`id`, `drug1`, `drug2`, `drug3`, `drug4`, `drug5`) VALUES
(1, 'metamizole', 'AAS', '', '', ''),
(2, 'acenocoumarol', 'levomepromazine', 'metamizole', '', ''),
(3, 'enoxaparin ', 'adalimumab', 'mepivacaine', '', ''),
(4, 'enoxaparin', 'rituximab', 'paracetamol', '', ''),
(5, 'AAS', 'amoxicillin', 'adalimumab', '', ''),
(6, 'acenocoumarol', 'tacrolimus', '', '', ''),
(7, 'amoxicillin', 'adalimumab', 'levofloxacin', 'AAS', 'ceftriaxone'),
(8, 'amoxicillin', '', '', '', ''),
(9, 'AAS', 'metamizole', '', '', ''),
(10, 'ceftriaxone', 'amiodarone', '', '', ''),
(11, 'amoxicillin', 'AAS', 'vancomycin', '', ''),
(12, 'amoxicillin', 'AAS', '', '', ''),
(13, 'amoxicillin', 'levomepromazine', 'tacrolimus', 'iomeprol', 'ciprofloxacin'),
(14, 'ciprofloxacin', 'mepivacaine', '', '', ''),
(15, 'AAS', 'paracetamol', 'amiodarone', '', ''),
(16, 'ceftriaxone', 'iomeprol', 'levomepromazine', 'amiodarone', 'levofloxacin'),
(17, 'ciprofloxacin', 'AAS', 'enoxaparin ', '', ''),
(18, 'ceftriaxone', '', '', '', ''),
(19, 'amiodarone', 'tacrolimus', 'enoxaparin ', 'paracetamol', 'ceftriaxone'),
(20, 'metamizole', '', '', '', ''),
(21, 'metamizole', 'ciprofloxacin', '', '', ''),
(22, 'adalimumab', 'rituximab', '', '', ''),
(23, 'enoxaparin ', 'ceftriaxone', '', '', ''),
(24, 'amoxicillin', 'adalimumab', '', '', ''),
(25, 'amoxicillin', 'paracetamol', '', '', '');
