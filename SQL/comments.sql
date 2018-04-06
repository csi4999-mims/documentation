--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `Comment_ID` int(11) NOT NULL,
  `Comment_Description` varchar(250) NOT NULL,
  `Comment_Email` varchar(50) NOT NULL,
  `Report_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
