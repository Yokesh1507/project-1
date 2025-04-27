-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 05, 2025 at 11:21 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `learning_mgmt`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_admin`
--

CREATE TABLE `ci_admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `commission` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_admin`
--

INSERT INTO `ci_admin` (`username`, `password`, `commission`) VALUES
('admin', 'admin', 10);

-- --------------------------------------------------------

--
-- Table structure for table `ci_category`
--

CREATE TABLE `ci_category` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_category`
--

INSERT INTO `ci_category` (`id`, `category`) VALUES
(1, 'Atificial Intelligence'),
(2, 'Data Science'),
(3, 'Web Development'),
(4, 'Finance and Banking');

-- --------------------------------------------------------

--
-- Table structure for table `ci_course`
--

CREATE TABLE `ci_course` (
  `id` int(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `category` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `details` text NOT NULL,
  `course_st` varchar(20) NOT NULL,
  `fees` double NOT NULL,
  `pos_percent` double NOT NULL,
  `neg_percent` double NOT NULL,
  `duration` varchar(30) NOT NULL,
  `star` double NOT NULL,
  `best_st` int(11) NOT NULL,
  `score` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_course`
--

INSERT INTO `ci_course` (`id`, `uname`, `category`, `course`, `details`, `course_st`, `fees`, `pos_percent`, `neg_percent`, `duration`, `star`, `best_st`, `score`) VALUES
(1, 'M001', 'Atificial Intelligence', 'Python for Beginners', 'Python with MySQL', 'C001', 5000, 0, 0, '3', 3.17, 2, 100),
(2, 'M002', 'Data Science', 'Data Science Fundamentals', 'Data Science', 'C002', 3000, 0, 0, '2', 3.12, 1, 0),
(3, 'M003', 'Atificial Intelligence', 'Machine Learning Basics', 'ML', 'C003', 5000, 0, 0, '2', 3.24, 2, 0),
(4, 'M004', 'Atificial Intelligence', 'Deep Learning Advanced', 'DL', 'C004', 10000, 0, 0, '3', 3.22, 2, 0),
(5, 'M005', 'Web Development', 'Python for Beginners', 'Python, Flask', 'C005', 5000, 0, 0, '1', 3.2, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ci_exam`
--

CREATE TABLE `ci_exam` (
  `id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `num_question` int(11) NOT NULL,
  `mark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_exam`
--

INSERT INTO `ci_exam` (`id`, `sid`, `num_question`, `mark`) VALUES
(1, 1, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ci_exam1`
--

CREATE TABLE `ci_exam1` (
  `id` int(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `eid` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `attend` int(11) NOT NULL,
  `correct` int(11) NOT NULL,
  `mark` int(11) NOT NULL,
  `percent` double NOT NULL,
  `status` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_exam1`
--

INSERT INTO `ci_exam1` (`id`, `uname`, `eid`, `total`, `attend`, `correct`, `mark`, `percent`, `status`, `qid`, `sid`) VALUES
(1, 'S105', 1, 5, 5, 2, 1, 20, 1, 1, 1),
(2, 'S112', 1, 5, 5, 1, 1, 20, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ci_exam_attend`
--

CREATE TABLE `ci_exam_attend` (
  `id` int(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `eid` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `attend` int(11) NOT NULL,
  `correct` int(11) NOT NULL,
  `mark` int(11) NOT NULL,
  `percent` double NOT NULL,
  `status` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_exam_attend`
--

INSERT INTO `ci_exam_attend` (`id`, `uname`, `eid`, `total`, `attend`, `correct`, `mark`, `percent`, `status`, `qid`, `sid`) VALUES
(3, 'S112', 1, 5, 5, 3, 3, 60, 1, 9, 1),
(4, 'S119', 1, 5, 5, 4, 4, 80, 1, 2, 1),
(5, 'S105', 1, 5, 5, 5, 5, 100, 1, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ci_join`
--

CREATE TABLE `ci_join` (
  `id` int(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `staff` varchar(20) NOT NULL,
  `cid` int(11) NOT NULL,
  `fees` double NOT NULL,
  `amount1` double NOT NULL,
  `amount2` double NOT NULL,
  `paid` double NOT NULL,
  `rdate` varchar(15) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `course` varchar(20) NOT NULL,
  `test_mark` double NOT NULL,
  `test_st` int(11) NOT NULL,
  `certificate_st` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `attend` int(11) NOT NULL,
  `seconds` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_join`
--

INSERT INTO `ci_join` (`id`, `uname`, `staff`, `cid`, `fees`, `amount1`, `amount2`, `paid`, `rdate`, `month`, `year`, `course`, `test_mark`, `test_st`, `certificate_st`, `exam_id`, `attend`, `seconds`) VALUES
(1, 'S105', 'M001', 1, 5000, 4500, 500, 5000, '21-02-2025', 2, 2025, 'Python', 0, 0, 0, 1, 75, 40),
(2, 'S112', 'M001', 1, 3000, 2700, 300, 3000, '21-02-2025', 2, 2025, 'Python', 0, 0, 0, 1, 65, 40),
(3, 'S119', 'M001', 1, 5000, 1500, 0, 5000, '02-03-2025', 3, 2025, 'Python', 0, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ci_question`
--

CREATE TABLE `ci_question` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `question` varchar(200) NOT NULL,
  `option1` varchar(100) NOT NULL,
  `option2` varchar(100) NOT NULL,
  `option3` varchar(100) NOT NULL,
  `option4` varchar(100) NOT NULL,
  `answer` int(11) NOT NULL,
  `details` text NOT NULL,
  `filename` varchar(50) NOT NULL,
  `qtype` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_question`
--

INSERT INTO `ci_question` (`id`, `cid`, `question`, `option1`, `option2`, `option3`, `option4`, `answer`, `details`, `filename`, `qtype`) VALUES
(1, 1, 'Which type of Programming does Python support?', 'object-oriented programming', 'structured programming', 'functional programming', 'all of the mentioned', 4, '', '', 1),
(2, 1, 'Is Python case sensitive when dealing with identifiers?', 'no', 'yes', 'machine dependent', 'none of the mentioned', 2, '', '', 1),
(3, 1, 'Which of the following is the correct extension of the Python file?', '.python', '.pl', '.py', '.p', 3, '', '', 1),
(4, 1, 'Is Python code compiled or interpreted?', 'Python code is both compiled and interpreted', 'Python code is neither compiled nor interpreted', 'Python code is only compiled', 'Python code is only interpreted', 1, '', '', 1),
(5, 1, 'All keywords in Python are in', 'Capitalized', 'lower case', 'UPPER CASE', 'None of the mentioned', 4, '', '', 1),
(6, 1, 'Which of the following is used to define a block of code in Python language?', 'Indentation', 'Key', 'Brackets', 'All of the mentioned', 1, '', '', 1),
(7, 1, 'Which keyword is used for function in Python language?', 'Function', 'def', 'Fun', 'Define', 2, '', '', 1),
(8, 1, 'Which of the following character is used to give single-line comments in Python?', '//', '#', '!', '/*', 2, '', '', 1),
(9, 1, 'Which of the following functions can help us to find the version of python that we are currently working on?', 'sys.version(1)', 'sys.version(0)', 'sys.version()', 'sys.version', 4, '', '', 1),
(10, 1, 'What does pip stand for python?', 'Pip Installs Python', 'Pip Installs Packages', 'Preferred Installer Program', 'All of the mentioned', 3, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ci_reviews`
--

CREATE TABLE `ci_reviews` (
  `id` int(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `staff` varchar(20) NOT NULL,
  `cid` int(11) NOT NULL,
  `join_id` int(11) NOT NULL,
  `reviews` varchar(200) NOT NULL,
  `star` int(11) NOT NULL,
  `rdate` varchar(20) NOT NULL,
  `pos_st` int(11) NOT NULL,
  `neg_st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_reviews`
--

INSERT INTO `ci_reviews` (`id`, `uname`, `staff`, `cid`, `join_id`, `reviews`, `star`, `rdate`, `pos_st`, `neg_st`) VALUES
(1, 'raj', 'kumar', 1, 1, 'teaching has good	', 4, '21-02-2025', 1, 0),
(2, 'mahesh', 'kumar', 2, 2, 'Good', 4, '20-02-2025', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ci_review_data`
--

CREATE TABLE `ci_review_data` (
  `id` int(11) NOT NULL,
  `review_id` varchar(20) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `course_id` varchar(20) NOT NULL,
  `mentor_id` varchar(20) NOT NULL,
  `review_text` text NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `mentor_name` varchar(30) NOT NULL,
  `engagement` varchar(20) NOT NULL,
  `difficulty` varchar(20) NOT NULL,
  `relevance` varchar(20) NOT NULL,
  `expertise` varchar(20) NOT NULL,
  `processed_review` text NOT NULL,
  `sentiment` varchar(20) NOT NULL,
  `estimated_rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_review_data`
--

INSERT INTO `ci_review_data` (`id`, `review_id`, `student_id`, `course_id`, `mentor_id`, `review_text`, `course_name`, `mentor_name`, `engagement`, `difficulty`, `relevance`, `expertise`, `processed_review`, `sentiment`, `estimated_rating`) VALUES
(1, 'R001', 'S118', 'C002', 'M002', 'The course lacked structure and was hard to follow.', 'Data Science Fundamentals', 'Prof. S. Mehta', 'Low', 'Difficult', 'Low', 'Intermediate', 'course lacked structure hard follow', 'Negative', 1),
(2, 'R002', 'S128', 'C001', 'M001', 'Too theoretical, needs more practical examples.', 'Python for Beginners', 'Dr. A. Kumar', 'Low', 'Easy', 'High', 'Expert', 'theoretical need practical example', 'Positive', 4),
(3, 'R003', 'S113', 'C005', 'M004', 'Too theoretical, needs more practical examples.', 'Deep Learning Advanced', 'Mr. L. Das', 'Low', 'Moderate', 'High', 'Beginner', 'theoretical need practical example', 'Neutral', 3),
(4, 'R004', 'S111', 'C004', 'M003', 'The course was okay, but could use more real-world examples.', 'Machine Learning Basics', 'Ms. R. Sharma', 'Medium', 'Easy', 'Low', 'Expert', 'course okay could use realworld example', 'Positive', 4),
(5, 'R005', 'S107', 'C003', 'M003', 'The course was okay, but could use more real-world examples.', 'Web Development', 'Ms. R. Sharma', 'High', 'Moderate', 'Low', 'Expert', 'course okay could use realworld example', 'Positive', 4),
(6, 'R006', 'S125', 'C001', 'M005', 'Very basic and not engaging enough.', 'Python for Beginners', 'Dr. V. Rao', 'Medium', 'Difficult', 'High', 'Expert', 'basic engaging enough', 'Neutral', 3),
(7, 'R007', 'S105', 'C001', 'M002', 'Good, but not much interaction from the mentor.', 'Python for Beginners', 'Prof. S. Mehta', 'Medium', 'Easy', 'Low', 'Intermediate', 'good much interaction mentor', 'Positive', 4),
(8, 'R008', 'S141', 'C003', 'M002', 'Highly recommended! The course structure is great.', 'Web Development', 'Prof. S. Mehta', 'Medium', 'Moderate', 'Low', 'Intermediate', 'highly recommended course structure great', 'Positive', 4),
(9, 'R009', 'S144', 'C001', 'M005', 'I didn’t learn as much as I expected.', 'Python for Beginners', 'Dr. V. Rao', 'High', 'Easy', 'High', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(10, 'R010', 'S125', 'C003', 'M005', 'Mentor did not respond to questions effectively.', 'Web Development', 'Dr. V. Rao', 'Low', 'Difficult', 'Medium', 'Expert', 'mentor respond question effectively', 'Positive', 4),
(11, 'R011', 'S121', 'C004', 'M003', 'Excellent teaching style and very interactive sessions.', 'Machine Learning Basics', 'Ms. R. Sharma', 'Low', 'Easy', 'High', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(12, 'R012', 'S132', 'C004', 'M004', 'I didn’t learn as much as I expected.', 'Machine Learning Basics', 'Mr. L. Das', 'Low', 'Moderate', 'Low', 'Beginner', 'didnt learn much expected', 'Neutral', 3),
(13, 'R013', 'S148', 'C005', 'M004', 'Mentor was very supportive and responded quickly.', 'Deep Learning Advanced', 'Mr. L. Das', 'High', 'Moderate', 'Medium', 'Beginner', 'mentor supportive responded quickly', 'Positive', 4),
(14, 'R014', 'S106', 'C001', 'M001', 'Excellent teaching style and very interactive sessions.', 'Python for Beginners', 'Dr. A. Kumar', 'Low', 'Difficult', 'Low', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(15, 'R015', 'S125', 'C004', 'M005', 'Very basic and not engaging enough.', 'Machine Learning Basics', 'Dr. V. Rao', 'Medium', 'Difficult', 'Medium', 'Expert', 'basic engaging enough', 'Neutral', 3),
(16, 'R016', 'S108', 'C005', 'M003', 'The course lacked structure and was hard to follow.', 'Deep Learning Advanced', 'Ms. R. Sharma', 'High', 'Moderate', 'Low', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(17, 'R017', 'S101', 'C003', 'M005', 'Some topics were covered in depth, others were rushed.', 'Web Development', 'Dr. V. Rao', 'Low', 'Difficult', 'Low', 'Expert', 'topic covered depth others rushed', 'Neutral', 3),
(18, 'R018', 'S133', 'C005', 'M002', 'I didn’t learn as much as I expected.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'Low', 'Moderate', 'Low', 'Intermediate', 'didnt learn much expected', 'Neutral', 3),
(19, 'R019', 'S139', 'C003', 'M004', 'Too theoretical, needs more practical examples.', 'Web Development', 'Mr. L. Das', 'Low', 'Easy', 'Medium', 'Beginner', 'theoretical need practical example', 'Neutral', 3),
(20, 'R020', 'S137', 'C001', 'M001', 'Mentor explained well but the pace was a bit slow.', 'Python for Beginners', 'Dr. A. Kumar', 'High', 'Moderate', 'Low', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(21, 'R021', 'S131', 'C005', 'M002', 'Mentor did not respond to questions effectively.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'Medium', 'Difficult', 'High', 'Intermediate', 'mentor respond question effectively', 'Positive', 4),
(22, 'R022', 'S149', 'C002', 'M003', 'Mentor explained well but the pace was a bit slow.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'Medium', 'Difficult', 'High', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(23, 'R023', 'S129', 'C001', 'M002', 'Some topics were covered in depth, others were rushed.', 'Python for Beginners', 'Prof. S. Mehta', 'Low', 'Easy', 'Medium', 'Intermediate', 'topic covered depth others rushed', 'Neutral', 3),
(24, 'R024', 'S138', 'C002', 'M001', 'Mentor was very supportive and responded quickly.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'Low', 'Difficult', 'High', 'Expert', 'mentor supportive responded quickly', 'Positive', 4),
(25, 'R025', 'S103', 'C003', 'M001', 'Excellent teaching style and very interactive sessions.', 'Web Development', 'Dr. A. Kumar', 'High', 'Easy', 'Medium', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(26, 'R026', 'S109', 'C005', 'M005', 'Very basic and not engaging enough.', 'Deep Learning Advanced', 'Dr. V. Rao', 'Medium', 'Easy', 'Medium', 'Expert', 'basic engaging enough', 'Neutral', 3),
(27, 'R027', 'S143', 'C004', 'M003', 'Mentor explained well but the pace was a bit slow.', 'Machine Learning Basics', 'Ms. R. Sharma', 'Medium', 'Moderate', 'Medium', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(28, 'R028', 'S142', 'C001', 'M001', 'The course lacked structure and was hard to follow.', 'Python for Beginners', 'Dr. A. Kumar', 'Medium', 'Easy', 'High', 'Expert', 'course lacked structure hard follow', 'Positive', 4),
(29, 'R029', 'S135', 'C004', 'M002', 'Excellent teaching style and very interactive sessions.', 'Machine Learning Basics', 'Prof. S. Mehta', 'Medium', 'Easy', 'Medium', 'Intermediate', 'excellent teaching style interactive session', 'Positive', 4),
(30, 'R030', 'S105', 'C004', 'M005', 'Mentor explained well but the pace was a bit slow.', 'Machine Learning Basics', 'Dr. V. Rao', 'Low', 'Easy', 'High', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(31, 'R031', 'S149', 'C002', 'M002', 'The course lacked structure and was hard to follow.', 'Data Science Fundamentals', 'Prof. S. Mehta', 'Medium', 'Moderate', 'Medium', 'Intermediate', 'course lacked structure hard follow', 'Negative', 1),
(32, 'R032', 'S111', 'C004', 'M001', 'Highly recommended! The course structure is great.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Medium', 'Moderate', 'Medium', 'Expert', 'highly recommended course structure great', 'Positive', 4),
(33, 'R033', 'S147', 'C005', 'M004', 'Some topics were covered in depth, others were rushed.', 'Deep Learning Advanced', 'Mr. L. Das', 'Low', 'Easy', 'Medium', 'Beginner', 'topic covered depth others rushed', 'Neutral', 3),
(34, 'R034', 'S135', 'C001', 'M003', 'The course content was very informative and the mentor explained clearly.', 'Python for Beginners', 'Ms. R. Sharma', 'Low', 'Easy', 'High', 'Expert', 'course content informative mentor explained clearly', 'Neutral', 3),
(35, 'R035', 'S134', 'C002', 'M001', 'Good, but not much interaction from the mentor.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'High', 'Easy', 'Low', 'Expert', 'good much interaction mentor', 'Positive', 4),
(36, 'R036', 'S116', 'C004', 'M001', 'Mentor was very supportive and responded quickly.', 'Machine Learning Basics', 'Dr. A. Kumar', 'High', 'Easy', 'High', 'Expert', 'mentor supportive responded quickly', 'Positive', 4),
(37, 'R037', 'S127', 'C005', 'M005', 'The course lacked structure and was hard to follow.', 'Deep Learning Advanced', 'Dr. V. Rao', 'High', 'Moderate', 'Medium', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(38, 'R038', 'S126', 'C002', 'M003', 'Loved the examples and the mentor’s expertise really shows.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'Medium', 'Moderate', 'Low', 'Expert', 'loved example mentor expertise really show', 'Positive', 4),
(39, 'R039', 'S137', 'C001', 'M001', 'Highly recommended! The course structure is great.', 'Python for Beginners', 'Dr. A. Kumar', 'High', 'Easy', 'High', 'Expert', 'highly recommended course structure great', 'Positive', 4),
(40, 'R040', 'S105', 'C002', 'M003', 'Mentor explained well but the pace was a bit slow.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'Medium', 'Easy', 'Medium', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(41, 'R041', 'S142', 'C005', 'M001', 'I didn’t learn as much as I expected.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'High', 'Difficult', 'Medium', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(42, 'R042', 'S109', 'C003', 'M001', 'The course lacked structure and was hard to follow.', 'Web Development', 'Dr. A. Kumar', 'Low', 'Difficult', 'High', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(43, 'R043', 'S114', 'C003', 'M002', 'Loved the examples and the mentor’s expertise really shows.', 'Web Development', 'Prof. S. Mehta', 'High', 'Difficult', 'Medium', 'Intermediate', 'loved example mentor expertise really show', 'Positive', 4),
(44, 'R044', 'S104', 'C001', 'M004', 'Very basic and not engaging enough.', 'Python for Beginners', 'Mr. L. Das', 'Medium', 'Easy', 'Low', 'Beginner', 'basic engaging enough', 'Neutral', 3),
(45, 'R045', 'S117', 'C002', 'M004', 'Mentor explained well but the pace was a bit slow.', 'Data Science Fundamentals', 'Mr. L. Das', 'High', 'Difficult', 'Medium', 'Beginner', 'mentor explained well pace bit slow', 'Negative', 1),
(46, 'R046', 'S145', 'C002', 'M005', 'The course lacked structure and was hard to follow.', 'Data Science Fundamentals', 'Dr. V. Rao', 'Low', 'Moderate', 'High', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(47, 'R047', 'S103', 'C003', 'M003', 'Mentor did not respond to questions effectively.', 'Web Development', 'Ms. R. Sharma', 'Low', 'Moderate', 'Low', 'Expert', 'mentor respond question effectively', 'Positive', 4),
(48, 'R048', 'S123', 'C005', 'M004', 'Mentor did not respond to questions effectively.', 'Deep Learning Advanced', 'Mr. L. Das', 'High', 'Difficult', 'Low', 'Beginner', 'mentor respond question effectively', 'Positive', 4),
(49, 'R049', 'S112', 'C004', 'M001', 'Excellent teaching style and very interactive sessions.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Low', 'Difficult', 'Medium', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(50, 'R050', 'S145', 'C001', 'M004', 'Mentor explained well but the pace was a bit slow.', 'Python for Beginners', 'Mr. L. Das', 'Low', 'Moderate', 'Low', 'Beginner', 'mentor explained well pace bit slow', 'Negative', 1),
(51, 'R051', 'S115', 'C002', 'M001', 'Highly recommended! The course structure is great.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'High', 'Easy', 'Medium', 'Expert', 'highly recommended course structure great', 'Positive', 4),
(52, 'R052', 'S150', 'C003', 'M003', 'Content was decent, not too exciting though.', 'Web Development', 'Ms. R. Sharma', 'High', 'Difficult', 'Medium', 'Expert', 'content decent exciting though', 'Positive', 4),
(53, 'R053', 'S102', 'C001', 'M003', 'Too theoretical, needs more practical examples.', 'Python for Beginners', 'Ms. R. Sharma', 'Low', 'Difficult', 'Medium', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(54, 'R054', 'S123', 'C003', 'M004', 'The course content was very informative and the mentor explained clearly.', 'Web Development', 'Mr. L. Das', 'High', 'Difficult', 'Low', 'Beginner', 'course content informative mentor explained clearly', 'Neutral', 3),
(55, 'R055', 'S103', 'C004', 'M001', 'Good, but not much interaction from the mentor.', 'Machine Learning Basics', 'Dr. A. Kumar', 'High', 'Difficult', 'High', 'Expert', 'good much interaction mentor', 'Positive', 4),
(56, 'R056', 'S105', 'C003', 'M005', 'Mentor did not respond to questions effectively.', 'Web Development', 'Dr. V. Rao', 'Medium', 'Difficult', 'Low', 'Expert', 'mentor respond question effectively', 'Positive', 4),
(57, 'R057', 'S143', 'C004', 'M003', 'I didnt learn as much as I expected.', 'Machine Learning Basics', 'Ms. R. Sharma', 'Medium', 'Difficult', 'Medium', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(58, 'R058', 'S143', 'C004', 'M002', 'Mentor did not respond to questions effectively.', 'Machine Learning Basics', 'Prof. S. Mehta', 'High', 'Difficult', 'Medium', 'Intermediate', 'mentor respond question effectively', 'Positive', 4),
(59, 'R059', 'S120', 'C003', 'M002', 'Good, but not much interaction from the mentor.', 'Web Development', 'Prof. S. Mehta', 'Medium', 'Difficult', 'High', 'Intermediate', 'good much interaction mentor', 'Positive', 4),
(60, 'R060', 'S129', 'C002', 'M005', 'I didn’t learn as much as I expected.', 'Data Science Fundamentals', 'Dr. V. Rao', 'Medium', 'Difficult', 'Low', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(61, 'R061', 'S143', 'C005', 'M003', 'The course lacked structure and was hard to follow.', 'Deep Learning Advanced', 'Ms. R. Sharma', 'Low', 'Easy', 'High', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(62, 'R062', 'S110', 'C001', 'M001', 'Mentor explained well but the pace was a bit slow.', 'Python for Beginners', 'Dr. A. Kumar', 'Low', 'Moderate', 'High', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(63, 'R063', 'S141', 'C005', 'M002', 'Highly recommended! The course structure is great.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'High', 'Difficult', 'Medium', 'Intermediate', 'highly recommended course structure great', 'Positive', 4),
(64, 'R064', 'S142', 'C001', 'M001', 'Some topics were covered in depth, others were rushed.', 'Python for Beginners', 'Dr. A. Kumar', 'Medium', 'Easy', 'High', 'Expert', 'topic covered depth others rushed', 'Positive', 4),
(65, 'R065', 'S136', 'C002', 'M001', 'Too theoretical, needs more practical examples.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'Medium', 'Easy', 'Medium', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(66, 'R066', 'S139', 'C003', 'M004', 'Too theoretical, needs more practical examples.', 'Web Development', 'Mr. L. Das', 'High', 'Difficult', 'High', 'Beginner', 'theoretical need practical example', 'Neutral', 3),
(67, 'R067', 'S111', 'C004', 'M004', 'Good, but not much interaction from the mentor.', 'Machine Learning Basics', 'Mr. L. Das', 'Medium', 'Easy', 'High', 'Beginner', 'good much interaction mentor', 'Positive', 4),
(68, 'R068', 'S116', 'C003', 'M004', 'Good, but not much interaction from the mentor.', 'Web Development', 'Mr. L. Das', 'Low', 'Difficult', 'Medium', 'Beginner', 'good much interaction mentor', 'Positive', 4),
(69, 'R069', 'S135', 'C001', 'M002', 'Loved the examples and the mentor’s expertise really shows.', 'Python for Beginners', 'Prof. S. Mehta', 'Low', 'Easy', 'Medium', 'Intermediate', 'loved example mentor expertise really show', 'Positive', 4),
(70, 'R070', 'S105', 'C004', 'M004', 'Mentor did not respond to questions effectively.', 'Machine Learning Basics', 'Mr. L. Das', 'Medium', 'Difficult', 'Medium', 'Beginner', 'mentor respond question effectively', 'Positive', 4),
(71, 'R071', 'S127', 'C004', 'M005', 'The course was okay, but could use more real-world examples.', 'Machine Learning Basics', 'Dr. V. Rao', 'High', 'Easy', 'High', 'Expert', 'course okay could use realworld example', 'Positive', 4),
(72, 'R072', 'S123', 'C003', 'M004', 'Some topics were covered in depth, others were rushed.', 'Web Development', 'Mr. L. Das', 'Medium', 'Difficult', 'High', 'Beginner', 'topic covered depth others rushed', 'Neutral', 3),
(73, 'R073', 'S115', 'C004', 'M002', 'Too theoretical, needs more practical examples.', 'Machine Learning Basics', 'Prof. S. Mehta', 'Medium', 'Moderate', 'Medium', 'Intermediate', 'theoretical need practical example', 'Neutral', 3),
(74, 'R074', 'S144', 'C004', 'M002', 'Highly recommended! The course structure is great.', 'Machine Learning Basics', 'Prof. S. Mehta', 'Medium', 'Easy', 'High', 'Intermediate', 'highly recommended course structure great', 'Positive', 4),
(75, 'R075', 'S138', 'C005', 'M001', 'The course lacked structure and was hard to follow.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'Low', 'Difficult', 'Medium', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(76, 'R076', 'S117', 'C004', 'M003', 'Highly recommended! The course structure is great.', 'Machine Learning Basics', 'Ms. R. Sharma', 'Low', 'Moderate', 'Medium', 'Expert', 'highly recommended course structure great', 'Positive', 4),
(77, 'R077', 'S127', 'C003', 'M001', 'Some topics were covered in depth, others were rushed.', 'Web Development', 'Dr. A. Kumar', 'Medium', 'Easy', 'High', 'Expert', 'topic covered depth others rushed', 'Neutral', 3),
(78, 'R078', 'S123', 'C002', 'M001', 'The course lacked structure and was hard to follow.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'High', 'Easy', 'Low', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(79, 'R079', 'S140', 'C002', 'M002', 'Excellent teaching style and very interactive sessions.', 'Data Science Fundamentals', 'Prof. S. Mehta', 'Low', 'Moderate', 'High', 'Intermediate', 'excellent teaching style interactive session', 'Positive', 4),
(80, 'R080', 'S130', 'C003', 'M003', 'Mentor was very supportive and responded quickly.', 'Web Development', 'Ms. R. Sharma', 'Low', 'Difficult', 'High', 'Expert', 'mentor supportive responded quickly', 'Positive', 4),
(81, 'R081', 'S111', 'C003', 'M001', 'The course lacked structure and was hard to follow.', 'Web Development', 'Dr. A. Kumar', 'High', 'Easy', 'Medium', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(82, 'R082', 'S146', 'C002', 'M001', 'Very basic and not engaging enough.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'High', 'Difficult', 'High', 'Expert', 'basic engaging enough', 'Neutral', 3),
(83, 'R083', 'S120', 'C005', 'M001', 'The course content was very informative and the mentor explained clearly.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'High', 'Easy', 'Medium', 'Expert', 'course content informative mentor explained clearly', 'Neutral', 3),
(84, 'R084', 'S105', 'C005', 'M003', 'Very basic and not engaging enough.', 'Deep Learning Advanced', 'Ms. R. Sharma', 'Low', 'Moderate', 'Medium', 'Expert', 'basic engaging enough', 'Neutral', 3),
(85, 'R085', 'S141', 'C004', 'M002', 'Highly recommended! The course structure is great.', 'Machine Learning Basics', 'Prof. S. Mehta', 'Medium', 'Easy', 'High', 'Intermediate', 'highly recommended course structure great', 'Positive', 4),
(86, 'R086', 'S135', 'C004', 'M004', 'I didn’t learn as much as I expected.', 'Machine Learning Basics', 'Mr. L. Das', 'Medium', 'Difficult', 'High', 'Beginner', 'didnt learn much expected', 'Neutral', 3),
(87, 'R087', 'S106', 'C003', 'M004', 'Content was decent, not too exciting though.', 'Web Development', 'Mr. L. Das', 'Low', 'Moderate', 'High', 'Beginner', 'content decent exciting though', 'Positive', 4),
(88, 'R088', 'S132', 'C003', 'M002', 'Very basic and not engaging enough.', 'Web Development', 'Prof. S. Mehta', 'Medium', 'Easy', 'Medium', 'Intermediate', 'basic engaging enough', 'Neutral', 3),
(89, 'R089', 'S139', 'C003', 'M005', 'Content was decent, not too exciting though.', 'Web Development', 'Dr. V. Rao', 'Low', 'Difficult', 'Low', 'Expert', 'content decent exciting though', 'Positive', 4),
(90, 'R090', 'S132', 'C005', 'M002', 'Excellent teaching style and very interactive sessions.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'High', 'Moderate', 'High', 'Intermediate', 'excellent teaching style interactive session', 'Positive', 4),
(91, 'R091', 'S102', 'C001', 'M003', 'Very basic and not engaging enough.', 'Python for Beginners', 'Ms. R. Sharma', 'Low', 'Moderate', 'High', 'Expert', 'basic engaging enough', 'Neutral', 3),
(92, 'R092', 'S124', 'C004', 'M005', 'Loved the examples and the mentor’s expertise really shows.', 'Machine Learning Basics', 'Dr. V. Rao', 'High', 'Moderate', 'Medium', 'Expert', 'loved example mentor expertise really show', 'Positive', 4),
(93, 'R093', 'S145', 'C004', 'M003', 'Too theoretical, needs more practical examples.', 'Machine Learning Basics', 'Ms. R. Sharma', 'Medium', 'Moderate', 'Low', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(94, 'R094', 'S148', 'C005', 'M002', 'Excellent teaching style and very interactive sessions.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'Low', 'Easy', 'High', 'Intermediate', 'excellent teaching style interactive session', 'Positive', 4),
(95, 'R095', 'S149', 'C005', 'M005', 'Content was decent, not too exciting though.', 'Deep Learning Advanced', 'Dr. V. Rao', 'Medium', 'Easy', 'Low', 'Expert', 'content decent exciting though', 'Positive', 4),
(96, 'R096', 'S120', 'C001', 'M005', 'Mentor explained well but the pace was a bit slow.', 'Python for Beginners', 'Dr. V. Rao', 'Low', 'Moderate', 'Low', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(97, 'R097', 'S109', 'C004', 'M001', 'Mentor was very supportive and responded quickly.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Low', 'Difficult', 'Medium', 'Expert', 'mentor supportive responded quickly', 'Positive', 4),
(98, 'R098', 'S112', 'C001', 'M003', 'Some topics were covered in depth, others were rushed.', 'Python for Beginners', 'Ms. R. Sharma', 'Medium', 'Easy', 'Low', 'Expert', 'topic covered depth others rushed', 'Neutral', 3),
(99, 'R099', 'S141', 'C001', 'M002', 'Some topics were covered in depth, others were rushed.', 'Python for Beginners', 'Prof. S. Mehta', 'Low', 'Difficult', 'Medium', 'Intermediate', 'topic covered depth others rushed', 'Neutral', 3),
(100, 'R100', 'S149', 'C004', 'M005', 'Excellent teaching style and very interactive sessions.', 'Machine Learning Basics', 'Dr. V. Rao', 'High', 'Difficult', 'Low', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(101, 'R101', 'S129', 'C003', 'M005', 'Very basic and not engaging enough.', 'Web Development', 'Dr. V. Rao', 'Medium', 'Moderate', 'High', 'Expert', 'basic engaging enough', 'Neutral', 3),
(102, 'R102', 'S148', 'C001', 'M002', 'The course lacked structure and was hard to follow.', 'Python for Beginners', 'Prof. S. Mehta', 'High', 'Easy', 'Medium', 'Intermediate', 'course lacked structure hard follow', 'Negative', 1),
(103, 'R103', 'S112', 'C005', 'M001', 'The course lacked structure and was hard to follow.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'Low', 'Easy', 'Medium', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(104, 'R104', 'S103', 'C002', 'M003', 'Good, but not much interaction from the mentor.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'High', 'Moderate', 'High', 'Expert', 'good much interaction mentor', 'Positive', 4),
(105, 'R105', 'S117', 'C005', 'M002', 'The course was okay, but could use more real-world examples.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'Medium', 'Easy', 'High', 'Intermediate', 'course okay could use realworld example', 'Positive', 4),
(106, 'R106', 'S110', 'C001', 'M001', 'Excellent teaching style and very interactive sessions.', 'Python for Beginners', 'Dr. A. Kumar', 'Low', 'Moderate', 'High', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(107, 'R107', 'S129', 'C001', 'M004', 'Too theoretical, needs more practical examples.', 'Python for Beginners', 'Mr. L. Das', 'High', 'Moderate', 'High', 'Beginner', 'theoretical need practical example', 'Neutral', 3),
(108, 'R108', 'S132', 'C004', 'M001', 'Content was decent, not too exciting though.', 'Machine Learning Basics', 'Dr. A. Kumar', 'High', 'Easy', 'Medium', 'Expert', 'content decent exciting though', 'Positive', 4),
(109, 'R109', 'S102', 'C001', 'M002', 'I didn’t learn as much as I expected.', 'Python for Beginners', 'Prof. S. Mehta', 'High', 'Difficult', 'High', 'Intermediate', 'didnt learn much expected', 'Neutral', 3),
(110, 'R110', 'S149', 'C002', 'M004', 'Loved the examples and the mentor’s expertise really shows.', 'Data Science Fundamentals', 'Mr. L. Das', 'High', 'Difficult', 'Medium', 'Beginner', 'loved example mentor expertise really show', 'Positive', 4),
(111, 'R111', 'S128', 'C004', 'M001', 'Mentor explained well but the pace was a bit slow.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Medium', 'Moderate', 'Medium', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(112, 'R112', 'S111', 'C003', 'M004', 'Content was decent, not too exciting though.', 'Web Development', 'Mr. L. Das', 'High', 'Moderate', 'Medium', 'Beginner', 'content decent exciting though', 'Positive', 4),
(113, 'R113', 'S136', 'C001', 'M004', 'Very basic and not engaging enough.', 'Python for Beginners', 'Mr. L. Das', 'Low', 'Moderate', 'Medium', 'Beginner', 'basic engaging enough', 'Neutral', 3),
(114, 'R114', 'S126', 'C005', 'M001', 'The course was okay, but could use more real-world examples.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'High', 'Difficult', 'Medium', 'Expert', 'course okay could use realworld example', 'Positive', 4),
(115, 'R115', 'S124', 'C005', 'M004', 'The course was okay, but could use more real-world examples.', 'Deep Learning Advanced', 'Mr. L. Das', 'High', 'Moderate', 'Low', 'Beginner', 'course okay could use realworld example', 'Positive', 4),
(116, 'R116', 'S119', 'C004', 'M004', 'Loved the examples and the mentor’s expertise really shows.', 'Machine Learning Basics', 'Mr. L. Das', 'Low', 'Easy', 'High', 'Beginner', 'loved example mentor expertise really show', 'Positive', 4),
(117, 'R117', 'S120', 'C005', 'M001', 'Mentor did not respond to questions effectively.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'High', 'Moderate', 'Low', 'Expert', 'mentor respond question effectively', 'Positive', 4),
(118, 'R118', 'S108', 'C002', 'M004', 'The course content was very informative and the mentor explained clearly.', 'Data Science Fundamentals', 'Mr. L. Das', 'High', 'Moderate', 'High', 'Beginner', 'course content informative mentor explained clearly', 'Neutral', 3),
(119, 'R119', 'S131', 'C004', 'M002', 'I didn’t learn as much as I expected.', 'Machine Learning Basics', 'Prof. S. Mehta', 'Medium', 'Difficult', 'Low', 'Intermediate', 'didnt learn much expected', 'Neutral', 3),
(120, 'R120', 'S133', 'C002', 'M001', 'Mentor explained well but the pace was a bit slow.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'Medium', 'Moderate', 'Medium', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(121, 'R121', 'S119', 'C003', 'M005', 'I didn’t learn as much as I expected.', 'Web Development', 'Dr. V. Rao', 'High', 'Difficult', 'Medium', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(122, 'R122', 'S123', 'C003', 'M005', 'Highly recommended! The course structure is great.', 'Web Development', 'Dr. V. Rao', 'High', 'Moderate', 'Medium', 'Expert', 'highly recommended course structure great', 'Positive', 4),
(123, 'R123', 'S116', 'C005', 'M004', 'Mentor explained well but the pace was a bit slow.', 'Deep Learning Advanced', 'Mr. L. Das', 'Low', 'Moderate', 'Low', 'Beginner', 'mentor explained well pace bit slow', 'Negative', 1),
(124, 'R124', 'S125', 'C004', 'M002', 'Some topics were covered in depth, others were rushed.', 'Machine Learning Basics', 'Prof. S. Mehta', 'Medium', 'Easy', 'Low', 'Intermediate', 'topic covered depth others rushed', 'Neutral', 3),
(125, 'R125', 'S107', 'C004', 'M001', 'Too theoretical, needs more practical examples.', 'Machine Learning Basics', 'Dr. A. Kumar', 'High', 'Moderate', 'Low', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(126, 'R126', 'S142', 'C002', 'M001', 'Mentor did not respond to questions effectively.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'Medium', 'Moderate', 'Medium', 'Expert', 'mentor respond question effectively', 'Positive', 4),
(127, 'R127', 'S122', 'C005', 'M004', 'Very basic and not engaging enough.', 'Deep Learning Advanced', 'Mr. L. Das', 'Medium', 'Difficult', 'High', 'Beginner', 'basic engaging enough', 'Neutral', 3),
(128, 'R128', 'S105', 'C002', 'M003', 'Good, but not much interaction from the mentor.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'Low', 'Difficult', 'Low', 'Expert', 'good much interaction mentor', 'Positive', 4),
(129, 'R129', 'S146', 'C001', 'M004', 'The course was okay, but could use more real-world examples.', 'Python for Beginners', 'Mr. L. Das', 'Low', 'Difficult', 'Medium', 'Beginner', 'course okay could use realworld example', 'Positive', 4),
(130, 'R130', 'S104', 'C003', 'M003', 'The course content was very informative and the mentor explained clearly.', 'Web Development', 'Ms. R. Sharma', 'Medium', 'Moderate', 'Low', 'Expert', 'course content informative mentor explained clearly', 'Neutral', 3),
(131, 'R131', 'S144', 'C002', 'M002', 'Mentor was very supportive and responded quickly.', 'Data Science Fundamentals', 'Prof. S. Mehta', 'Low', 'Easy', 'High', 'Intermediate', 'mentor supportive responded quickly', 'Positive', 4),
(132, 'R132', 'S132', 'C005', 'M002', 'Good, but not much interaction from the mentor.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'Low', 'Moderate', 'High', 'Intermediate', 'good much interaction mentor', 'Positive', 4),
(133, 'R133', 'S101', 'C004', 'M003', 'Some topics were covered in depth, others were rushed.', 'Machine Learning Basics', 'Ms. R. Sharma', 'High', 'Difficult', 'Low', 'Expert', 'topic covered depth others rushed', 'Neutral', 3),
(134, 'R134', 'S138', 'C003', 'M004', 'Highly recommended! The course structure is great.', 'Web Development', 'Mr. L. Das', 'High', 'Moderate', 'Medium', 'Beginner', 'highly recommended course structure great', 'Positive', 4),
(135, 'R135', 'S131', 'C001', 'M002', 'Mentor explained well but the pace was a bit slow.', 'Python for Beginners', 'Prof. S. Mehta', 'Medium', 'Difficult', 'Medium', 'Intermediate', 'mentor explained well pace bit slow', 'Negative', 1),
(136, 'R136', 'S119', 'C001', 'M004', 'I didn’t learn as much as I expected.', 'Python for Beginners', 'Mr. L. Das', 'Medium', 'Easy', 'High', 'Beginner', 'didnt learn much expected', 'Neutral', 3),
(137, 'R137', 'S148', 'C004', 'M003', 'The course lacked structure and was hard to follow.', 'Machine Learning Basics', 'Ms. R. Sharma', 'Low', 'Difficult', 'Medium', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(138, 'R138', 'S144', 'C002', 'M001', 'Excellent teaching style and very interactive sessions.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'High', 'Difficult', 'Low', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(139, 'R139', 'S124', 'C002', 'M001', 'Some topics were covered in depth, others were rushed.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'Medium', 'Moderate', 'High', 'Expert', 'topic covered depth others rushed', 'Neutral', 3),
(140, 'R140', 'S135', 'C003', 'M005', 'Mentor explained well but the pace was a bit slow.', 'Web Development', 'Dr. V. Rao', 'High', 'Moderate', 'Low', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(141, 'R141', 'S119', 'C003', 'M001', 'Some topics were covered in depth, others were rushed.', 'Web Development', 'Dr. A. Kumar', 'Medium', 'Easy', 'Low', 'Expert', 'topic covered depth others rushed', 'Neutral', 3),
(142, 'R142', 'S136', 'C003', 'M001', 'Highly recommended! The course structure is great.', 'Web Development', 'Dr. A. Kumar', 'Medium', 'Easy', 'Medium', 'Expert', 'highly recommended course structure great', 'Positive', 4),
(143, 'R143', 'S144', 'C003', 'M005', 'The course lacked structure and was hard to follow.', 'Web Development', 'Dr. V. Rao', 'Medium', 'Difficult', 'Medium', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(144, 'R144', 'S140', 'C005', 'M003', 'Excellent teaching style and very interactive sessions.', 'Deep Learning Advanced', 'Ms. R. Sharma', 'High', 'Easy', 'High', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(145, 'R145', 'S120', 'C004', 'M001', 'Highly recommended! The course structure is great.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Low', 'Easy', 'Low', 'Expert', 'highly recommended course structure great', 'Positive', 4),
(146, 'R146', 'S116', 'C005', 'M002', 'Some topics were covered in depth, others were rushed.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'Medium', 'Moderate', 'Medium', 'Intermediate', 'topic covered depth others rushed', 'Neutral', 3),
(147, 'R147', 'S148', 'C002', 'M004', 'Too theoretical, needs more practical examples.', 'Data Science Fundamentals', 'Mr. L. Das', 'High', 'Easy', 'Medium', 'Beginner', 'theoretical need practical example', 'Neutral', 3),
(148, 'R148', 'S118', 'C001', 'M003', 'Very basic and not engaging enough.', 'Python for Beginners', 'Ms. R. Sharma', 'Low', 'Moderate', 'Medium', 'Expert', 'basic engaging enough', 'Neutral', 3),
(149, 'R149', 'S144', 'C003', 'M005', 'Loved the examples and the mentor’s expertise really shows.', 'Web Development', 'Dr. V. Rao', 'High', 'Moderate', 'Low', 'Expert', 'loved example mentor expertise really show', 'Positive', 4),
(150, 'R150', 'S108', 'C004', 'M001', 'Content was decent, not too exciting though.', 'Machine Learning Basics', 'Dr. A. Kumar', 'High', 'Easy', 'High', 'Expert', 'content decent exciting though', 'Positive', 4),
(151, 'R151', 'S104', 'C003', 'M002', 'Too theoretical, needs more practical examples.', 'Web Development', 'Prof. S. Mehta', 'Low', 'Difficult', 'Low', 'Intermediate', 'theoretical need practical example', 'Neutral', 3),
(152, 'R152', 'S114', 'C002', 'M003', 'Mentor was very supportive and responded quickly.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'Low', 'Difficult', 'Low', 'Expert', 'mentor supportive responded quickly', 'Positive', 4),
(153, 'R153', 'S135', 'C003', 'M002', 'Mentor explained well but the pace was a bit slow.', 'Web Development', 'Prof. S. Mehta', 'Low', 'Difficult', 'Low', 'Intermediate', 'mentor explained well pace bit slow', 'Negative', 1),
(154, 'R154', 'S116', 'C005', 'M003', 'The course content was very informative and the mentor explained clearly.', 'Deep Learning Advanced', 'Ms. R. Sharma', 'Low', 'Easy', 'Medium', 'Expert', 'course content informative mentor explained clearly', 'Neutral', 3),
(155, 'R155', 'S134', 'C001', 'M001', 'Excellent teaching style and very interactive sessions.', 'Python for Beginners', 'Dr. A. Kumar', 'Medium', 'Moderate', 'Medium', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(156, 'R156', 'S133', 'C002', 'M005', 'Too theoretical, needs more practical examples.', 'Data Science Fundamentals', 'Dr. V. Rao', 'Low', 'Difficult', 'High', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(157, 'R157', 'S102', 'C001', 'M004', 'I didn’t learn as much as I expected.', 'Python for Beginners', 'Mr. L. Das', 'Medium', 'Moderate', 'High', 'Beginner', 'didnt learn much expected', 'Neutral', 3),
(158, 'R158', 'S129', 'C001', 'M001', 'Highly recommended! The course structure is great.', 'Python for Beginners', 'Dr. A. Kumar', 'Medium', 'Difficult', 'Low', 'Expert', 'highly recommended course structure great', 'Positive', 4),
(159, 'R159', 'S141', 'C005', 'M005', 'Excellent teaching style and very interactive sessions.', 'Deep Learning Advanced', 'Dr. V. Rao', 'High', 'Moderate', 'Medium', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(160, 'R160', 'S133', 'C005', 'M004', 'Too theoretical, needs more practical examples.', 'Deep Learning Advanced', 'Mr. L. Das', 'Low', 'Difficult', 'Low', 'Beginner', 'theoretical need practical example', 'Neutral', 3),
(161, 'R161', 'S114', 'C004', 'M004', 'Too theoretical, needs more practical examples.', 'Machine Learning Basics', 'Mr. L. Das', 'Low', 'Moderate', 'Medium', 'Beginner', 'theoretical need practical example', 'Neutral', 3),
(162, 'R162', 'S107', 'C003', 'M004', 'Some topics were covered in depth, others were rushed.', 'Web Development', 'Mr. L. Das', 'Medium', 'Difficult', 'Medium', 'Beginner', 'topic covered depth others rushed', 'Neutral', 3),
(163, 'R163', 'S131', 'C001', 'M001', 'Mentor explained well but the pace was a bit slow.', 'Python for Beginners', 'Dr. A. Kumar', 'Low', 'Easy', 'Medium', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(164, 'R164', 'S136', 'C001', 'M005', 'Loved the examples and the mentor’s expertise really shows.', 'Python for Beginners', 'Dr. V. Rao', 'High', 'Difficult', 'Medium', 'Expert', 'loved example mentor expertise really show', 'Positive', 4),
(165, 'R165', 'S143', 'C004', 'M001', 'The course lacked structure and was hard to follow.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Medium', 'Difficult', 'Medium', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(166, 'R166', 'S114', 'C002', 'M004', 'The course was okay, but could use more real-world examples.', 'Data Science Fundamentals', 'Mr. L. Das', 'Low', 'Easy', 'Medium', 'Beginner', 'course okay could use realworld example', 'Positive', 4),
(167, 'R167', 'S118', 'C005', 'M002', 'I didn’t learn as much as I expected.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'Medium', 'Difficult', 'High', 'Intermediate', 'didnt learn much expected', 'Neutral', 3),
(168, 'R168', 'S143', 'C003', 'M001', 'Too theoretical, needs more practical examples.', 'Web Development', 'Dr. A. Kumar', 'Low', 'Moderate', 'High', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(169, 'R169', 'S112', 'C002', 'M005', 'Content was decent, not too exciting though.', 'Data Science Fundamentals', 'Dr. V. Rao', 'High', 'Moderate', 'Low', 'Expert', 'content decent exciting though', 'Positive', 4),
(170, 'R170', 'S134', 'C002', 'M004', 'The course content was very informative and the mentor explained clearly.', 'Data Science Fundamentals', 'Mr. L. Das', 'Medium', 'Moderate', 'Medium', 'Beginner', 'course content informative mentor explained clearly', 'Neutral', 3),
(171, 'R171', 'S121', 'C005', 'M005', 'Loved the examples and the mentor’s expertise really shows.', 'Deep Learning Advanced', 'Dr. V. Rao', 'Low', 'Easy', 'Low', 'Expert', 'loved example mentor expertise really show', 'Positive', 4),
(172, 'R172', 'S106', 'C003', 'M004', 'Mentor was very supportive and responded quickly.', 'Web Development', 'Mr. L. Das', 'High', 'Moderate', 'Medium', 'Beginner', 'mentor supportive responded quickly', 'Positive', 4),
(173, 'R173', 'S114', 'C005', 'M001', 'Very basic and not engaging enough.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'Medium', 'Moderate', 'Low', 'Expert', 'basic engaging enough', 'Neutral', 3),
(174, 'R174', 'S143', 'C003', 'M001', 'Good, but not much interaction from the mentor.', 'Web Development', 'Dr. A. Kumar', 'Low', 'Moderate', 'High', 'Expert', 'good much interaction mentor', 'Positive', 4),
(175, 'R175', 'S114', 'C002', 'M003', 'The course content was very informative and the mentor explained clearly.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'Medium', 'Moderate', 'Low', 'Expert', 'course content informative mentor explained clearly', 'Neutral', 3),
(176, 'R176', 'S112', 'C002', 'M004', 'Highly recommended! The course structure is great.', 'Data Science Fundamentals', 'Mr. L. Das', 'High', 'Difficult', 'Low', 'Beginner', 'highly recommended course structure great', 'Positive', 4),
(177, 'R177', 'S123', 'C001', 'M004', 'Too theoretical, needs more practical examples.', 'Python for Beginners', 'Mr. L. Das', 'High', 'Easy', 'Medium', 'Beginner', 'theoretical need practical example', 'Neutral', 3),
(178, 'R178', 'S121', 'C005', 'M004', 'Highly recommended! The course structure is great.', 'Deep Learning Advanced', 'Mr. L. Das', 'High', 'Moderate', 'High', 'Beginner', 'highly recommended course structure great', 'Positive', 4),
(179, 'R179', 'S126', 'C001', 'M003', 'Very basic and not engaging enough.', 'Python for Beginners', 'Ms. R. Sharma', 'Low', 'Difficult', 'Medium', 'Expert', 'basic engaging enough', 'Neutral', 3),
(180, 'R180', 'S107', 'C002', 'M004', 'I didn’t learn as much as I expected.', 'Data Science Fundamentals', 'Mr. L. Das', 'High', 'Moderate', 'High', 'Beginner', 'didnt learn much expected', 'Neutral', 3),
(181, 'R181', 'S148', 'C003', 'M002', 'Highly recommended! The course structure is great.', 'Web Development', 'Prof. S. Mehta', 'Medium', 'Easy', 'Low', 'Intermediate', 'highly recommended course structure great', 'Positive', 4),
(182, 'R182', 'S113', 'C003', 'M003', 'The course lacked structure and was hard to follow.', 'Web Development', 'Ms. R. Sharma', 'High', 'Difficult', 'Low', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(183, 'R183', 'S113', 'C002', 'M005', 'The course content was very informative and the mentor explained clearly.', 'Data Science Fundamentals', 'Dr. V. Rao', 'Low', 'Difficult', 'Low', 'Expert', 'course content informative mentor explained clearly', 'Neutral', 3),
(184, 'R184', 'S137', 'C005', 'M004', 'Highly recommended! The course structure is great.', 'Deep Learning Advanced', 'Mr. L. Das', 'High', 'Difficult', 'High', 'Beginner', 'highly recommended course structure great', 'Positive', 4),
(185, 'R185', 'S141', 'C003', 'M002', 'Too theoretical, needs more practical examples.', 'Web Development', 'Prof. S. Mehta', 'Medium', 'Easy', 'Medium', 'Intermediate', 'theoretical need practical example', 'Neutral', 3),
(186, 'R186', 'S138', 'C001', 'M003', 'Content was decent, not too exciting though.', 'Python for Beginners', 'Ms. R. Sharma', 'High', 'Easy', 'Medium', 'Expert', 'content decent exciting though', 'Positive', 4),
(187, 'R187', 'S124', 'C003', 'M001', 'Some topics were covered in depth, others were rushed.', 'Web Development', 'Dr. A. Kumar', 'High', 'Easy', 'High', 'Expert', 'topic covered depth others rushed', 'Neutral', 3),
(188, 'R188', 'S138', 'C005', 'M001', 'Too theoretical, needs more practical examples.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'Medium', 'Difficult', 'High', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(189, 'R189', 'S133', 'C002', 'M001', 'Loved the examples and the mentor’s expertise really shows.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'Medium', 'Easy', 'Medium', 'Expert', 'loved example mentor expertise really show', 'Positive', 4),
(190, 'R190', 'S112', 'C001', 'M002', 'The course lacked structure and was hard to follow.', 'Python for Beginners', 'Prof. S. Mehta', 'High', 'Moderate', 'Medium', 'Intermediate', 'course lacked structure hard follow', 'Negative', 1),
(191, 'R191', 'S124', 'C003', 'M003', 'Too theoretical, needs more practical examples.', 'Web Development', 'Ms. R. Sharma', 'Medium', 'Moderate', 'Medium', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(192, 'R192', 'S141', 'C003', 'M001', 'Too theoretical, needs more practical examples.', 'Web Development', 'Dr. A. Kumar', 'Medium', 'Easy', 'High', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(193, 'R193', 'S147', 'C005', 'M002', 'Very basic and not engaging enough.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'Medium', 'Easy', 'High', 'Intermediate', 'basic engaging enough', 'Neutral', 3),
(194, 'R194', 'S120', 'C004', 'M002', 'Mentor did not respond to questions effectively.', 'Machine Learning Basics', 'Prof. S. Mehta', 'High', 'Difficult', 'Low', 'Intermediate', 'mentor respond question effectively', 'Positive', 4),
(195, 'R195', 'S122', 'C002', 'M005', 'Good, but not much interaction from the mentor.', 'Data Science Fundamentals', 'Dr. V. Rao', 'Low', 'Difficult', 'High', 'Expert', 'good much interaction mentor', 'Positive', 4),
(196, 'R196', 'S124', 'C003', 'M002', 'Good, but not much interaction from the mentor.', 'Web Development', 'Prof. S. Mehta', 'Low', 'Moderate', 'Medium', 'Intermediate', 'good much interaction mentor', 'Positive', 4),
(197, 'R197', 'S110', 'C001', 'M003', 'Excellent teaching style and very interactive sessions.', 'Python for Beginners', 'Ms. R. Sharma', 'Low', 'Difficult', 'High', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(198, 'R198', 'S122', 'C005', 'M002', 'Too theoretical, needs more practical examples.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'High', 'Moderate', 'Low', 'Intermediate', 'theoretical need practical example', 'Neutral', 3),
(199, 'R199', 'S150', 'C005', 'M002', 'Excellent teaching style and very interactive sessions.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'High', 'Moderate', 'Low', 'Intermediate', 'excellent teaching style interactive session', 'Positive', 4),
(200, 'R200', 'S116', 'C004', 'M005', 'Content was decent, not too exciting though.', 'Machine Learning Basics', 'Dr. V. Rao', 'Medium', 'Difficult', 'Medium', 'Expert', 'content decent exciting though', 'Positive', 4),
(201, 'R201', 'S131', 'C002', 'M003', 'Mentor was very supportive and responded quickly.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'High', 'Difficult', 'Medium', 'Expert', 'mentor supportive responded quickly', 'Positive', 4),
(202, 'R202', 'S133', 'C005', 'M004', 'Content was decent, not too exciting though.', 'Deep Learning Advanced', 'Mr. L. Das', 'Low', 'Easy', 'High', 'Beginner', 'content decent exciting though', 'Positive', 4),
(203, 'R203', 'S131', 'C003', 'M005', 'Loved the examples and the mentor’s expertise really shows.', 'Web Development', 'Dr. V. Rao', 'Low', 'Difficult', 'High', 'Expert', 'loved example mentor expertise really show', 'Positive', 4),
(204, 'R204', 'S111', 'C003', 'M004', 'Loved the examples and the mentor’s expertise really shows.', 'Web Development', 'Mr. L. Das', 'High', 'Easy', 'Medium', 'Beginner', 'loved example mentor expertise really show', 'Positive', 4),
(205, 'R205', 'S123', 'C001', 'M004', 'Excellent teaching style and very interactive sessions.', 'Python for Beginners', 'Mr. L. Das', 'Low', 'Moderate', 'High', 'Beginner', 'excellent teaching style interactive session', 'Positive', 4),
(206, 'R206', 'S106', 'C003', 'M002', 'Mentor explained well but the pace was a bit slow.', 'Web Development', 'Prof. S. Mehta', 'Low', 'Moderate', 'Low', 'Intermediate', 'mentor explained well pace bit slow', 'Negative', 1),
(207, 'R207', 'S109', 'C001', 'M003', 'I didn’t learn as much as I expected.', 'Python for Beginners', 'Ms. R. Sharma', 'Medium', 'Difficult', 'Low', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(208, 'R208', 'S101', 'C001', 'M001', 'Very basic and not engaging enough.', 'Python for Beginners', 'Dr. A. Kumar', 'Medium', 'Easy', 'Low', 'Expert', 'basic engaging enough', 'Positive', 4),
(209, 'R209', 'S108', 'C003', 'M002', 'Too theoretical, needs more practical examples.', 'Web Development', 'Prof. S. Mehta', 'Medium', 'Easy', 'Low', 'Intermediate', 'theoretical need practical example', 'Neutral', 3),
(210, 'R210', 'S140', 'C004', 'M001', 'Highly recommended! The course structure is great.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Low', 'Moderate', 'High', 'Expert', 'highly recommended course structure great', 'Positive', 4),
(211, 'R211', 'S137', 'C002', 'M002', 'The course lacked structure and was hard to follow.', 'Data Science Fundamentals', 'Prof. S. Mehta', 'Medium', 'Moderate', 'Low', 'Intermediate', 'course lacked structure hard follow', 'Negative', 1),
(212, 'R212', 'S127', 'C002', 'M001', 'I didn’t learn as much as I expected.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'High', 'Moderate', 'Low', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(213, 'R213', 'S133', 'C005', 'M001', 'Too theoretical, needs more practical examples.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'Medium', 'Moderate', 'Low', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(214, 'R214', 'S117', 'C001', 'M003', 'Very basic and not engaging enough.', 'Python for Beginners', 'Ms. R. Sharma', 'Low', 'Moderate', 'Low', 'Expert', 'basic engaging enough', 'Neutral', 3),
(215, 'R215', 'S148', 'C003', 'M002', 'The course lacked structure and was hard to follow.', 'Web Development', 'Prof. S. Mehta', 'Low', 'Moderate', 'High', 'Intermediate', 'course lacked structure hard follow', 'Negative', 1),
(216, 'R216', 'S144', 'C004', 'M004', 'Mentor explained well but the pace was a bit slow.', 'Machine Learning Basics', 'Mr. L. Das', 'High', 'Easy', 'Low', 'Beginner', 'mentor explained well pace bit slow', 'Negative', 1),
(217, 'R217', 'S113', 'C001', 'M002', 'Highly recommended! The course structure is great.', 'Python for Beginners', 'Prof. S. Mehta', 'Low', 'Moderate', 'Medium', 'Intermediate', 'highly recommended course structure great', 'Positive', 4),
(218, 'R218', 'S135', 'C004', 'M003', 'Very basic and not engaging enough.', 'Machine Learning Basics', 'Ms. R. Sharma', 'Low', 'Difficult', 'Low', 'Expert', 'basic engaging enough', 'Neutral', 3),
(219, 'R219', 'S104', 'C003', 'M003', 'Content was decent, not too exciting though.', 'Web Development', 'Ms. R. Sharma', 'Low', 'Moderate', 'Medium', 'Expert', 'content decent exciting though', 'Positive', 4),
(220, 'R220', 'S125', 'C003', 'M002', 'Some topics were covered in depth, others were rushed.', 'Web Development', 'Prof. S. Mehta', 'Medium', 'Difficult', 'Medium', 'Intermediate', 'topic covered depth others rushed', 'Neutral', 3),
(221, 'R221', 'S106', 'C004', 'M001', 'Good, but not much interaction from the mentor.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Medium', 'Difficult', 'Low', 'Expert', 'good much interaction mentor', 'Positive', 4),
(222, 'R222', 'S106', 'C003', 'M003', 'I didn’t learn as much as I expected.', 'Web Development', 'Ms. R. Sharma', 'Medium', 'Moderate', 'High', 'Expert', 'didnt learn much expected', 'Neutral', 3);
INSERT INTO `ci_review_data` (`id`, `review_id`, `student_id`, `course_id`, `mentor_id`, `review_text`, `course_name`, `mentor_name`, `engagement`, `difficulty`, `relevance`, `expertise`, `processed_review`, `sentiment`, `estimated_rating`) VALUES
(223, 'R223', 'S129', 'C003', 'M004', 'Very basic and not engaging enough.', 'Web Development', 'Mr. L. Das', 'Low', 'Difficult', 'Medium', 'Beginner', 'basic engaging enough', 'Neutral', 3),
(224, 'R224', 'S104', 'C001', 'M004', 'Very basic and not engaging enough.', 'Python for Beginners', 'Mr. L. Das', 'Medium', 'Difficult', 'High', 'Beginner', 'basic engaging enough', 'Neutral', 3),
(225, 'R225', 'S110', 'C005', 'M004', 'Mentor did not respond to questions effectively.', 'Deep Learning Advanced', 'Mr. L. Das', 'Low', 'Easy', 'Low', 'Beginner', 'mentor respond question effectively', 'Positive', 4),
(226, 'R226', 'S137', 'C001', 'M005', 'Loved the examples and the mentor’s expertise really shows.', 'Python for Beginners', 'Dr. V. Rao', 'Low', 'Difficult', 'Medium', 'Expert', 'loved example mentor expertise really show', 'Positive', 4),
(227, 'R227', 'S105', 'C005', 'M002', 'Content was decent, not too exciting though.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'High', 'Moderate', 'Medium', 'Intermediate', 'content decent exciting though', 'Positive', 4),
(228, 'R228', 'S108', 'C001', 'M002', 'Content was decent, not too exciting though.', 'Python for Beginners', 'Prof. S. Mehta', 'Medium', 'Difficult', 'Medium', 'Intermediate', 'content decent exciting though', 'Positive', 4),
(229, 'R229', 'S117', 'C004', 'M002', 'The course lacked structure and was hard to follow.', 'Machine Learning Basics', 'Prof. S. Mehta', 'High', 'Moderate', 'High', 'Intermediate', 'course lacked structure hard follow', 'Negative', 1),
(230, 'R230', 'S105', 'C004', 'M002', 'Mentor explained well but the pace was a bit slow.', 'Machine Learning Basics', 'Prof. S. Mehta', 'High', 'Moderate', 'Low', 'Intermediate', 'mentor explained well pace bit slow', 'Negative', 1),
(231, 'R231', 'S146', 'C001', 'M005', 'I didn’t learn as much as I expected.', 'Python for Beginners', 'Dr. V. Rao', 'High', 'Moderate', 'Medium', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(232, 'R232', 'S133', 'C002', 'M001', 'Excellent teaching style and very interactive sessions.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'Low', 'Easy', 'Low', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(233, 'R233', 'S137', 'C003', 'M004', 'The course was okay, but could use more real-world examples.', 'Web Development', 'Mr. L. Das', 'High', 'Easy', 'High', 'Beginner', 'course okay could use realworld example', 'Positive', 4),
(234, 'R234', 'S146', 'C004', 'M005', 'The course content was very informative and the mentor explained clearly.', 'Machine Learning Basics', 'Dr. V. Rao', 'Medium', 'Moderate', 'High', 'Expert', 'course content informative mentor explained clearly', 'Neutral', 3),
(235, 'R235', 'S142', 'C001', 'M004', 'Excellent teaching style and very interactive sessions.', 'Python for Beginners', 'Mr. L. Das', 'Medium', 'Difficult', 'High', 'Beginner', 'excellent teaching style interactive session', 'Positive', 4),
(236, 'R236', 'S150', 'C005', 'M005', 'Mentor explained well but the pace was a bit slow.', 'Deep Learning Advanced', 'Dr. V. Rao', 'Low', 'Easy', 'Medium', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(237, 'R237', 'S134', 'C002', 'M003', 'The course lacked structure and was hard to follow.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'Low', 'Easy', 'Medium', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(238, 'R238', 'S134', 'C003', 'M001', 'Mentor did not respond to questions effectively.', 'Web Development', 'Dr. A. Kumar', 'Medium', 'Easy', 'High', 'Expert', 'mentor respond question effectively', 'Positive', 4),
(239, 'R239', 'S120', 'C005', 'M005', 'I didn’t learn as much as I expected.', 'Deep Learning Advanced', 'Dr. V. Rao', 'Low', 'Difficult', 'High', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(240, 'R240', 'S110', 'C002', 'M005', 'Mentor was very supportive and responded quickly.', 'Data Science Fundamentals', 'Dr. V. Rao', 'High', 'Difficult', 'Medium', 'Expert', 'mentor supportive responded quickly', 'Positive', 4),
(241, 'R241', 'S102', 'C001', 'M001', 'The course lacked structure and was hard to follow.', 'Python for Beginners', 'Dr. A. Kumar', 'High', 'Difficult', 'Medium', 'Expert', 'course lacked structure hard follow', 'Positive', 4),
(242, 'R242', 'S127', 'C005', 'M001', 'Mentor did not respond to questions effectively.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'Medium', 'Difficult', 'High', 'Expert', 'mentor respond question effectively', 'Positive', 4),
(243, 'R243', 'S144', 'C004', 'M003', 'Content was decent, not too exciting though.', 'Machine Learning Basics', 'Ms. R. Sharma', 'Medium', 'Easy', 'High', 'Expert', 'content decent exciting though', 'Positive', 4),
(244, 'R244', 'S131', 'C004', 'M002', 'Excellent teaching style and very interactive sessions.', 'Machine Learning Basics', 'Prof. S. Mehta', 'Medium', 'Difficult', 'Low', 'Intermediate', 'excellent teaching style interactive session', 'Positive', 4),
(245, 'R245', 'S123', 'C004', 'M002', 'Content was decent, not too exciting though.', 'Machine Learning Basics', 'Prof. S. Mehta', 'Medium', 'Difficult', 'High', 'Intermediate', 'content decent exciting though', 'Positive', 4),
(246, 'R246', 'S108', 'C003', 'M004', 'Loved the examples and the mentor’s expertise really shows.', 'Web Development', 'Mr. L. Das', 'Low', 'Easy', 'Low', 'Beginner', 'loved example mentor expertise really show', 'Positive', 4),
(247, 'R247', 'S140', 'C004', 'M002', 'Loved the examples and the mentor’s expertise really shows.', 'Machine Learning Basics', 'Prof. S. Mehta', 'Low', 'Moderate', 'High', 'Intermediate', 'loved example mentor expertise really show', 'Positive', 4),
(248, 'R248', 'S111', 'C004', 'M005', 'I didn’t learn as much as I expected.', 'Machine Learning Basics', 'Dr. V. Rao', 'Medium', 'Moderate', 'Medium', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(249, 'R249', 'S126', 'C005', 'M004', 'The course was okay, but could use more real-world examples.', 'Deep Learning Advanced', 'Mr. L. Das', 'Low', 'Easy', 'High', 'Beginner', 'course okay could use realworld example', 'Positive', 4),
(250, 'R250', 'S132', 'C005', 'M004', 'The course was okay, but could use more real-world examples.', 'Deep Learning Advanced', 'Mr. L. Das', 'Medium', 'Difficult', 'Low', 'Beginner', 'course okay could use realworld example', 'Positive', 4),
(251, 'R251', 'S117', 'C003', 'M004', 'Highly recommended! The course structure is great.', 'Web Development', 'Mr. L. Das', 'Medium', 'Easy', 'Medium', 'Beginner', 'highly recommended course structure great', 'Positive', 4),
(252, 'R252', 'S124', 'C005', 'M003', 'Mentor was very supportive and responded quickly.', 'Deep Learning Advanced', 'Ms. R. Sharma', 'Low', 'Moderate', 'High', 'Expert', 'mentor supportive responded quickly', 'Positive', 4),
(253, 'R253', 'S140', 'C005', 'M001', 'Good, but not much interaction from the mentor.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'Low', 'Easy', 'Medium', 'Expert', 'good much interaction mentor', 'Positive', 4),
(254, 'R254', 'S124', 'C002', 'M002', 'Content was decent, not too exciting though.', 'Data Science Fundamentals', 'Prof. S. Mehta', 'High', 'Difficult', 'Medium', 'Intermediate', 'content decent exciting though', 'Positive', 4),
(255, 'R255', 'S109', 'C003', 'M004', 'The course lacked structure and was hard to follow.', 'Web Development', 'Mr. L. Das', 'High', 'Moderate', 'Low', 'Beginner', 'course lacked structure hard follow', 'Negative', 1),
(256, 'R256', 'S140', 'C003', 'M002', 'Too theoretical, needs more practical examples.', 'Web Development', 'Prof. S. Mehta', 'Medium', 'Difficult', 'High', 'Intermediate', 'theoretical need practical example', 'Neutral', 3),
(257, 'R257', 'S133', 'C005', 'M004', 'Good, but not much interaction from the mentor.', 'Deep Learning Advanced', 'Mr. L. Das', 'High', 'Difficult', 'Medium', 'Beginner', 'good much interaction mentor', 'Positive', 4),
(258, 'R258', 'S144', 'C001', 'M004', 'The course was okay, but could use more real-world examples.', 'Python for Beginners', 'Mr. L. Das', 'High', 'Moderate', 'High', 'Beginner', 'course okay could use realworld example', 'Positive', 4),
(259, 'R259', 'S117', 'C005', 'M005', 'The course lacked structure and was hard to follow.', 'Deep Learning Advanced', 'Dr. V. Rao', 'Low', 'Difficult', 'Low', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(260, 'R260', 'S141', 'C005', 'M004', 'Very basic and not engaging enough.', 'Deep Learning Advanced', 'Mr. L. Das', 'Low', 'Difficult', 'Low', 'Beginner', 'basic engaging enough', 'Neutral', 3),
(261, 'R261', 'S108', 'C002', 'M001', 'Mentor was very supportive and responded quickly.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'Medium', 'Moderate', 'Medium', 'Expert', 'mentor supportive responded quickly', 'Positive', 4),
(262, 'R262', 'S127', 'C005', 'M005', 'Highly recommended! The course structure is great.', 'Deep Learning Advanced', 'Dr. V. Rao', 'Medium', 'Difficult', 'High', 'Expert', 'highly recommended course structure great', 'Positive', 4),
(263, 'R263', 'S136', 'C003', 'M004', 'Excellent teaching style and very interactive sessions.', 'Web Development', 'Mr. L. Das', 'High', 'Moderate', 'Medium', 'Beginner', 'excellent teaching style interactive session', 'Positive', 4),
(264, 'R264', 'S122', 'C005', 'M003', 'Highly recommended! The course structure is great.', 'Deep Learning Advanced', 'Ms. R. Sharma', 'High', 'Difficult', 'High', 'Expert', 'highly recommended course structure great', 'Positive', 4),
(265, 'R265', 'S113', 'C002', 'M003', 'I didn’t learn as much as I expected.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'High', 'Moderate', 'Low', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(266, 'R266', 'S145', 'C004', 'M003', 'Content was decent, not too exciting though.', 'Machine Learning Basics', 'Ms. R. Sharma', 'Medium', 'Moderate', 'High', 'Expert', 'content decent exciting though', 'Positive', 4),
(267, 'R267', 'S137', 'C005', 'M004', 'I didn’t learn as much as I expected.', 'Deep Learning Advanced', 'Mr. L. Das', 'Medium', 'Moderate', 'Low', 'Beginner', 'didnt learn much expected', 'Neutral', 3),
(268, 'R268', 'S146', 'C001', 'M003', 'The course was okay, but could use more real-world examples.', 'Python for Beginners', 'Ms. R. Sharma', 'Medium', 'Difficult', 'Medium', 'Expert', 'course okay could use realworld example', 'Positive', 4),
(269, 'R269', 'S135', 'C003', 'M005', 'Very basic and not engaging enough.', 'Web Development', 'Dr. V. Rao', 'High', 'Moderate', 'Low', 'Expert', 'basic engaging enough', 'Neutral', 3),
(270, 'R270', 'S116', 'C002', 'M001', 'Mentor was very supportive and responded quickly.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'High', 'Difficult', 'Low', 'Expert', 'mentor supportive responded quickly', 'Positive', 4),
(271, 'R271', 'S127', 'C003', 'M004', 'Mentor did not respond to questions effectively.', 'Web Development', 'Mr. L. Das', 'Low', 'Difficult', 'Low', 'Beginner', 'mentor respond question effectively', 'Positive', 4),
(272, 'R272', 'S111', 'C004', 'M004', 'Mentor was very supportive and responded quickly.', 'Machine Learning Basics', 'Mr. L. Das', 'Medium', 'Difficult', 'Low', 'Beginner', 'mentor supportive responded quickly', 'Positive', 4),
(273, 'R273', 'S104', 'C001', 'M005', 'Content was decent, not too exciting though.', 'Python for Beginners', 'Dr. V. Rao', 'Low', 'Difficult', 'High', 'Expert', 'content decent exciting though', 'Positive', 4),
(274, 'R274', 'S112', 'C004', 'M002', 'The course lacked structure and was hard to follow.', 'Machine Learning Basics', 'Prof. S. Mehta', 'Low', 'Moderate', 'Medium', 'Intermediate', 'course lacked structure hard follow', 'Negative', 1),
(275, 'R275', 'S101', 'C003', 'M005', 'Loved the examples and the mentor’s expertise really shows.', 'Web Development', 'Dr. V. Rao', 'High', 'Easy', 'Medium', 'Expert', 'loved example mentor expertise really show', 'Positive', 4),
(276, 'R276', 'S135', 'C005', 'M004', 'Some topics were covered in depth, others were rushed.', 'Deep Learning Advanced', 'Mr. L. Das', 'Low', 'Difficult', 'Medium', 'Beginner', 'topic covered depth others rushed', 'Neutral', 3),
(277, 'R277', 'S122', 'C002', 'M004', 'Mentor explained well but the pace was a bit slow.', 'Data Science Fundamentals', 'Mr. L. Das', 'High', 'Moderate', 'High', 'Beginner', 'mentor explained well pace bit slow', 'Negative', 1),
(278, 'R278', 'S119', 'C005', 'M002', 'The course content was very informative and the mentor explained clearly.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'Low', 'Difficult', 'High', 'Intermediate', 'course content informative mentor explained clearly', 'Neutral', 3),
(279, 'R279', 'S106', 'C004', 'M001', 'Some topics were covered in depth, others were rushed.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Low', 'Easy', 'Medium', 'Expert', 'topic covered depth others rushed', 'Neutral', 3),
(280, 'R280', 'S125', 'C002', 'M004', 'Mentor explained well but the pace was a bit slow.', 'Data Science Fundamentals', 'Mr. L. Das', 'Medium', 'Moderate', 'Medium', 'Beginner', 'mentor explained well pace bit slow', 'Negative', 1),
(281, 'R281', 'S142', 'C003', 'M002', 'Too theoretical, needs more practical examples.', 'Web Development', 'Prof. S. Mehta', 'Low', 'Difficult', 'Low', 'Intermediate', 'theoretical need practical example', 'Neutral', 3),
(282, 'R282', 'S144', 'C005', 'M003', 'Content was decent, not too exciting though.', 'Deep Learning Advanced', 'Ms. R. Sharma', 'High', 'Easy', 'High', 'Expert', 'content decent exciting though', 'Positive', 4),
(283, 'R283', 'S115', 'C002', 'M004', 'Content was decent, not too exciting though.', 'Data Science Fundamentals', 'Mr. L. Das', 'Low', 'Moderate', 'High', 'Beginner', 'content decent exciting though', 'Positive', 4),
(284, 'R284', 'S136', 'C004', 'M005', 'I didn’t learn as much as I expected.', 'Machine Learning Basics', 'Dr. V. Rao', 'High', 'Easy', 'Low', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(285, 'R285', 'S106', 'C005', 'M004', 'Too theoretical, needs more practical examples.', 'Deep Learning Advanced', 'Mr. L. Das', 'High', 'Difficult', 'Medium', 'Beginner', 'theoretical need practical example', 'Neutral', 3),
(286, 'R286', 'S136', 'C005', 'M002', 'Mentor was very supportive and responded quickly.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'High', 'Difficult', 'Low', 'Intermediate', 'mentor supportive responded quickly', 'Positive', 4),
(287, 'R287', 'S129', 'C001', 'M002', 'Loved the examples and the mentor’s expertise really shows.', 'Python for Beginners', 'Prof. S. Mehta', 'High', 'Difficult', 'Medium', 'Intermediate', 'loved example mentor expertise really show', 'Positive', 4),
(288, 'R288', 'S104', 'C004', 'M002', 'Mentor was very supportive and responded quickly.', 'Machine Learning Basics', 'Prof. S. Mehta', 'High', 'Moderate', 'Medium', 'Intermediate', 'mentor supportive responded quickly', 'Positive', 4),
(289, 'R289', 'S144', 'C003', 'M001', 'The course lacked structure and was hard to follow.', 'Web Development', 'Dr. A. Kumar', 'Medium', 'Moderate', 'Low', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(290, 'R290', 'S103', 'C004', 'M003', 'Mentor did not respond to questions effectively.', 'Machine Learning Basics', 'Ms. R. Sharma', 'High', 'Easy', 'High', 'Expert', 'mentor respond question effectively', 'Positive', 4),
(291, 'R291', 'S131', 'C001', 'M003', 'The course content was very informative and the mentor explained clearly.', 'Python for Beginners', 'Ms. R. Sharma', 'Medium', 'Easy', 'Low', 'Expert', 'course content informative mentor explained clearly', 'Neutral', 3),
(292, 'R292', 'S125', 'C004', 'M004', 'Very basic and not engaging enough.', 'Machine Learning Basics', 'Mr. L. Das', 'Medium', 'Easy', 'High', 'Beginner', 'basic engaging enough', 'Neutral', 3),
(293, 'R293', 'S123', 'C001', 'M002', 'Too theoretical, needs more practical examples.', 'Python for Beginners', 'Prof. S. Mehta', 'High', 'Moderate', 'High', 'Intermediate', 'theoretical need practical example', 'Neutral', 3),
(294, 'R294', 'S149', 'C001', 'M003', 'Excellent teaching style and very interactive sessions.', 'Python for Beginners', 'Ms. R. Sharma', 'Medium', 'Difficult', 'High', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(295, 'R295', 'S115', 'C002', 'M004', 'Very basic and not engaging enough.', 'Data Science Fundamentals', 'Mr. L. Das', 'Medium', 'Easy', 'Medium', 'Beginner', 'basic engaging enough', 'Neutral', 3),
(296, 'R296', 'S143', 'C004', 'M005', 'The course content was very informative and the mentor explained clearly.', 'Machine Learning Basics', 'Dr. V. Rao', 'Low', 'Easy', 'Low', 'Expert', 'course content informative mentor explained clearly', 'Neutral', 3),
(297, 'R297', 'S129', 'C005', 'M001', 'The course content was very informative and the mentor explained clearly.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'Low', 'Difficult', 'Low', 'Expert', 'course content informative mentor explained clearly', 'Neutral', 3),
(298, 'R298', 'S114', 'C001', 'M002', 'Some topics were covered in depth, others were rushed.', 'Python for Beginners', 'Prof. S. Mehta', 'High', 'Moderate', 'Low', 'Intermediate', 'topic covered depth others rushed', 'Neutral', 3),
(299, 'R299', 'S139', 'C003', 'M002', 'Too theoretical, needs more practical examples.', 'Web Development', 'Prof. S. Mehta', 'Medium', 'Easy', 'High', 'Intermediate', 'theoretical need practical example', 'Neutral', 3),
(300, 'R300', 'S118', 'C001', 'M005', 'Mentor did not respond to questions effectively.', 'Python for Beginners', 'Dr. V. Rao', 'High', 'Difficult', 'Low', 'Expert', 'mentor respond question effectively', 'Positive', 4),
(301, 'R301', 'S104', 'C003', 'M004', 'Very basic and not engaging enough.', 'Web Development', 'Mr. L. Das', 'High', 'Moderate', 'High', 'Beginner', 'basic engaging enough', 'Neutral', 3),
(302, 'R302', 'S125', 'C002', 'M005', 'Some topics were covered in depth, others were rushed.', 'Data Science Fundamentals', 'Dr. V. Rao', 'Medium', 'Easy', 'Low', 'Expert', 'topic covered depth others rushed', 'Neutral', 3),
(303, 'R303', 'S104', 'C005', 'M004', 'Mentor explained well but the pace was a bit slow.', 'Deep Learning Advanced', 'Mr. L. Das', 'Medium', 'Difficult', 'High', 'Beginner', 'mentor explained well pace bit slow', 'Negative', 1),
(304, 'R304', 'S114', 'C003', 'M001', 'Highly recommended! The course structure is great.', 'Web Development', 'Dr. A. Kumar', 'Medium', 'Moderate', 'Low', 'Expert', 'highly recommended course structure great', 'Positive', 4),
(305, 'R305', 'S125', 'C005', 'M005', 'Mentor did not respond to questions effectively.', 'Deep Learning Advanced', 'Dr. V. Rao', 'Low', 'Easy', 'Low', 'Expert', 'mentor respond question effectively', 'Positive', 4),
(306, 'R306', 'S114', 'C003', 'M003', 'Too theoretical, needs more practical examples.', 'Web Development', 'Ms. R. Sharma', 'Low', 'Easy', 'Low', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(307, 'R307', 'S149', 'C004', 'M002', 'The course lacked structure and was hard to follow.', 'Machine Learning Basics', 'Prof. S. Mehta', 'High', 'Difficult', 'High', 'Intermediate', 'course lacked structure hard follow', 'Negative', 1),
(308, 'R308', 'S136', 'C003', 'M003', 'Highly recommended! The course structure is great.', 'Web Development', 'Ms. R. Sharma', 'Medium', 'Moderate', 'High', 'Expert', 'highly recommended course structure great', 'Positive', 4),
(309, 'R309', 'S124', 'C005', 'M004', 'I didn’t learn as much as I expected.', 'Deep Learning Advanced', 'Mr. L. Das', 'Medium', 'Easy', 'High', 'Beginner', 'didnt learn much expected', 'Neutral', 3),
(310, 'R310', 'S124', 'C003', 'M004', 'Content was decent, not too exciting though.', 'Web Development', 'Mr. L. Das', 'Low', 'Difficult', 'Low', 'Beginner', 'content decent exciting though', 'Positive', 4),
(311, 'R311', 'S136', 'C005', 'M005', 'Mentor did not respond to questions effectively.', 'Deep Learning Advanced', 'Dr. V. Rao', 'High', 'Moderate', 'Medium', 'Expert', 'mentor respond question effectively', 'Positive', 4),
(312, 'R312', 'S125', 'C005', 'M002', 'Excellent teaching style and very interactive sessions.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'Medium', 'Difficult', 'High', 'Intermediate', 'excellent teaching style interactive session', 'Positive', 4),
(313, 'R313', 'S132', 'C004', 'M004', 'I didn’t learn as much as I expected.', 'Machine Learning Basics', 'Mr. L. Das', 'Low', 'Difficult', 'Medium', 'Beginner', 'didnt learn much expected', 'Neutral', 3),
(314, 'R314', 'S132', 'C002', 'M005', 'Excellent teaching style and very interactive sessions.', 'Data Science Fundamentals', 'Dr. V. Rao', 'High', 'Easy', 'High', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(315, 'R315', 'S143', 'C001', 'M001', 'The course content was very informative and the mentor explained clearly.', 'Python for Beginners', 'Dr. A. Kumar', 'Medium', 'Easy', 'High', 'Expert', 'course content informative mentor explained clearly', 'Neutral', 3),
(316, 'R316', 'S101', 'C002', 'M005', 'The course content was very informative and the mentor explained clearly.', 'Data Science Fundamentals', 'Dr. V. Rao', 'Medium', 'Moderate', 'Low', 'Expert', 'course content informative mentor explained clearly', 'Neutral', 3),
(317, 'R317', 'S143', 'C004', 'M001', 'Too theoretical, needs more practical examples.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Low', 'Difficult', 'High', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(318, 'R318', 'S147', 'C003', 'M005', 'The course was okay, but could use more real-world examples.', 'Web Development', 'Dr. V. Rao', 'Medium', 'Easy', 'High', 'Expert', 'course okay could use realworld example', 'Positive', 4),
(319, 'R319', 'S112', 'C001', 'M001', 'Very basic and not engaging enough.', 'Python for Beginners', 'Dr. A. Kumar', 'High', 'Easy', 'Low', 'Expert', 'basic engaging enough', 'Neutral', 3),
(320, 'R320', 'S123', 'C003', 'M004', 'Mentor was very supportive and responded quickly.', 'Web Development', 'Mr. L. Das', 'Low', 'Moderate', 'Medium', 'Beginner', 'mentor supportive responded quickly', 'Positive', 4),
(321, 'R321', 'S145', 'C002', 'M003', 'Good, but not much interaction from the mentor.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'High', 'Easy', 'High', 'Expert', 'good much interaction mentor', 'Positive', 4),
(322, 'R322', 'S125', 'C004', 'M005', 'The course lacked structure and was hard to follow.', 'Machine Learning Basics', 'Dr. V. Rao', 'Medium', 'Easy', 'High', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(323, 'R323', 'S128', 'C003', 'M005', 'Excellent teaching style and very interactive sessions.', 'Web Development', 'Dr. V. Rao', 'Low', 'Difficult', 'Low', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(324, 'R324', 'S145', 'C005', 'M004', 'Excellent teaching style and very interactive sessions.', 'Deep Learning Advanced', 'Mr. L. Das', 'Medium', 'Easy', 'Low', 'Beginner', 'excellent teaching style interactive session', 'Positive', 4),
(325, 'R325', 'S137', 'C001', 'M002', 'I didn’t learn as much as I expected.', 'Python for Beginners', 'Prof. S. Mehta', 'Medium', 'Easy', 'Low', 'Intermediate', 'didnt learn much expected', 'Neutral', 3),
(326, 'R326', 'S146', 'C004', 'M001', 'Mentor did not respond to questions effectively.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Medium', 'Easy', 'High', 'Expert', 'mentor respond question effectively', 'Positive', 4),
(327, 'R327', 'S125', 'C005', 'M003', 'Mentor was very supportive and responded quickly.', 'Deep Learning Advanced', 'Ms. R. Sharma', 'Medium', 'Difficult', 'Low', 'Expert', 'mentor supportive responded quickly', 'Positive', 4),
(328, 'R328', 'S123', 'C001', 'M001', 'The course lacked structure and was hard to follow.', 'Python for Beginners', 'Dr. A. Kumar', 'Medium', 'Easy', 'High', 'Expert', 'course lacked structure hard follow', 'Positive', 4),
(329, 'R329', 'S139', 'C004', 'M003', 'Good, but not much interaction from the mentor.', 'Machine Learning Basics', 'Ms. R. Sharma', 'Low', 'Difficult', 'Medium', 'Expert', 'good much interaction mentor', 'Positive', 4),
(330, 'R330', 'S136', 'C004', 'M004', 'Some topics were covered in depth, others were rushed.', 'Machine Learning Basics', 'Mr. L. Das', 'Low', 'Difficult', 'High', 'Beginner', 'topic covered depth others rushed', 'Neutral', 3),
(331, 'R331', 'S140', 'C003', 'M002', 'Very basic and not engaging enough.', 'Web Development', 'Prof. S. Mehta', 'High', 'Easy', 'Low', 'Intermediate', 'basic engaging enough', 'Neutral', 3),
(332, 'R332', 'S141', 'C002', 'M004', 'Mentor explained well but the pace was a bit slow.', 'Data Science Fundamentals', 'Mr. L. Das', 'Medium', 'Moderate', 'Low', 'Beginner', 'mentor explained well pace bit slow', 'Negative', 1),
(333, 'R333', 'S129', 'C003', 'M003', 'The course content was very informative and the mentor explained clearly.', 'Web Development', 'Ms. R. Sharma', 'Low', 'Easy', 'Low', 'Expert', 'course content informative mentor explained clearly', 'Neutral', 3),
(334, 'R334', 'S136', 'C005', 'M004', 'Highly recommended! The course structure is great.', 'Deep Learning Advanced', 'Mr. L. Das', 'Low', 'Easy', 'Low', 'Beginner', 'highly recommended course structure great', 'Positive', 4),
(335, 'R335', 'S139', 'C003', 'M004', 'Good, but not much interaction from the mentor.', 'Web Development', 'Mr. L. Das', 'Low', 'Moderate', 'Medium', 'Beginner', 'good much interaction mentor', 'Positive', 4),
(336, 'R336', 'S136', 'C002', 'M005', 'The course was okay, but could use more real-world examples.', 'Data Science Fundamentals', 'Dr. V. Rao', 'High', 'Easy', 'High', 'Expert', 'course okay could use realworld example', 'Positive', 4),
(337, 'R337', 'S120', 'C003', 'M004', 'Mentor explained well but the pace was a bit slow.', 'Web Development', 'Mr. L. Das', 'Low', 'Easy', 'Low', 'Beginner', 'mentor explained well pace bit slow', 'Negative', 1),
(338, 'R338', 'S131', 'C001', 'M003', 'Content was decent, not too exciting though.', 'Python for Beginners', 'Ms. R. Sharma', 'Medium', 'Easy', 'High', 'Expert', 'content decent exciting though', 'Positive', 4),
(339, 'R339', 'S113', 'C004', 'M001', 'Very basic and not engaging enough.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Low', 'Moderate', 'Low', 'Expert', 'basic engaging enough', 'Neutral', 3),
(340, 'R340', 'S125', 'C003', 'M004', 'Content was decent, not too exciting though.', 'Web Development', 'Mr. L. Das', 'Medium', 'Moderate', 'High', 'Beginner', 'content decent exciting though', 'Positive', 4),
(341, 'R341', 'S139', 'C002', 'M004', 'Mentor did not respond to questions effectively.', 'Data Science Fundamentals', 'Mr. L. Das', 'Medium', 'Easy', 'Medium', 'Beginner', 'mentor respond question effectively', 'Positive', 4),
(342, 'R342', 'S141', 'C004', 'M005', 'Content was decent, not too exciting though.', 'Machine Learning Basics', 'Dr. V. Rao', 'Low', 'Moderate', 'Medium', 'Expert', 'content decent exciting though', 'Positive', 4),
(343, 'R343', 'S137', 'C002', 'M005', 'Some topics were covered in depth, others were rushed.', 'Data Science Fundamentals', 'Dr. V. Rao', 'High', 'Easy', 'High', 'Expert', 'topic covered depth others rushed', 'Neutral', 3),
(344, 'R344', 'S130', 'C002', 'M004', 'The course lacked structure and was hard to follow.', 'Data Science Fundamentals', 'Mr. L. Das', 'Medium', 'Difficult', 'Low', 'Beginner', 'course lacked structure hard follow', 'Negative', 1),
(345, 'R345', 'S120', 'C002', 'M003', 'Some topics were covered in depth, others were rushed.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'High', 'Easy', 'High', 'Expert', 'topic covered depth others rushed', 'Neutral', 3),
(346, 'R346', 'S139', 'C004', 'M005', 'Some topics were covered in depth, others were rushed.', 'Machine Learning Basics', 'Dr. V. Rao', 'Medium', 'Difficult', 'High', 'Expert', 'topic covered depth others rushed', 'Neutral', 3),
(347, 'R347', 'S124', 'C005', 'M005', 'Very basic and not engaging enough.', 'Deep Learning Advanced', 'Dr. V. Rao', 'High', 'Easy', 'Low', 'Expert', 'basic engaging enough', 'Neutral', 3),
(348, 'R348', 'S140', 'C001', 'M005', 'Loved the examples and the mentor’s expertise really shows.', 'Python for Beginners', 'Dr. V. Rao', 'High', 'Difficult', 'High', 'Expert', 'loved example mentor expertise really show', 'Positive', 4),
(349, 'R349', 'S128', 'C001', 'M001', 'Content was decent, not too exciting though.', 'Python for Beginners', 'Dr. A. Kumar', 'Low', 'Moderate', 'Low', 'Expert', 'content decent exciting though', 'Positive', 4),
(350, 'R350', 'S145', 'C005', 'M002', 'Too theoretical, needs more practical examples.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'Medium', 'Moderate', 'Medium', 'Intermediate', 'theoretical need practical example', 'Neutral', 3),
(351, 'R351', 'S110', 'C003', 'M001', 'Good, but not much interaction from the mentor.', 'Web Development', 'Dr. A. Kumar', 'Medium', 'Easy', 'Medium', 'Expert', 'good much interaction mentor', 'Positive', 4),
(352, 'R352', 'S147', 'C002', 'M003', 'The course was okay, but could use more real-world examples.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'Medium', 'Moderate', 'Medium', 'Expert', 'course okay could use realworld example', 'Positive', 4),
(353, 'R353', 'S131', 'C001', 'M004', 'Mentor was very supportive and responded quickly.', 'Python for Beginners', 'Mr. L. Das', 'High', 'Difficult', 'Medium', 'Beginner', 'mentor supportive responded quickly', 'Positive', 4),
(354, 'R354', 'S146', 'C001', 'M001', 'The course was okay, but could use more real-world examples.', 'Python for Beginners', 'Dr. A. Kumar', 'Medium', 'Difficult', 'Low', 'Expert', 'course okay could use realworld example', 'Positive', 4),
(355, 'R355', 'S148', 'C002', 'M005', 'Mentor did not respond to questions effectively.', 'Data Science Fundamentals', 'Dr. V. Rao', 'Low', 'Difficult', 'Low', 'Expert', 'mentor respond question effectively', 'Positive', 4),
(356, 'R356', 'S130', 'C002', 'M004', 'Good, but not much interaction from the mentor.', 'Data Science Fundamentals', 'Mr. L. Das', 'High', 'Easy', 'Low', 'Beginner', 'good much interaction mentor', 'Positive', 4),
(357, 'R357', 'S148', 'C005', 'M002', 'Very basic and not engaging enough.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'Medium', 'Difficult', 'Medium', 'Intermediate', 'basic engaging enough', 'Neutral', 3),
(358, 'R358', 'S114', 'C003', 'M001', 'The course was okay, but could use more real-world examples.', 'Web Development', 'Dr. A. Kumar', 'High', 'Easy', 'High', 'Expert', 'course okay could use realworld example', 'Positive', 4),
(359, 'R359', 'S130', 'C001', 'M003', 'Loved the examples and the mentor’s expertise really shows.', 'Python for Beginners', 'Ms. R. Sharma', 'High', 'Moderate', 'High', 'Expert', 'loved example mentor expertise really show', 'Positive', 4),
(360, 'R360', 'S140', 'C004', 'M005', 'I didn’t learn as much as I expected.', 'Machine Learning Basics', 'Dr. V. Rao', 'Low', 'Moderate', 'Medium', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(361, 'R361', 'S144', 'C003', 'M005', 'Good, but not much interaction from the mentor.', 'Web Development', 'Dr. V. Rao', 'High', 'Easy', 'High', 'Expert', 'good much interaction mentor', 'Positive', 4),
(362, 'R362', 'S120', 'C001', 'M002', 'Loved the examples and the mentor’s expertise really shows.', 'Python for Beginners', 'Prof. S. Mehta', 'Medium', 'Difficult', 'Low', 'Intermediate', 'loved example mentor expertise really show', 'Positive', 4),
(363, 'R363', 'S109', 'C005', 'M004', 'Very basic and not engaging enough.', 'Deep Learning Advanced', 'Mr. L. Das', 'Medium', 'Easy', 'Medium', 'Beginner', 'basic engaging enough', 'Neutral', 3),
(364, 'R364', 'S142', 'C002', 'M005', 'Too theoretical, needs more practical examples.', 'Data Science Fundamentals', 'Dr. V. Rao', 'Low', 'Moderate', 'Medium', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(365, 'R365', 'S129', 'C005', 'M001', 'Excellent teaching style and very interactive sessions.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'Medium', 'Easy', 'Medium', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(366, 'R366', 'S136', 'C005', 'M004', 'Excellent teaching style and very interactive sessions.', 'Deep Learning Advanced', 'Mr. L. Das', 'Medium', 'Difficult', 'Medium', 'Beginner', 'excellent teaching style interactive session', 'Positive', 4),
(367, 'R367', 'S106', 'C005', 'M001', 'Some topics were covered in depth, others were rushed.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'Low', 'Moderate', 'Low', 'Expert', 'topic covered depth others rushed', 'Neutral', 3),
(368, 'R368', 'S111', 'C004', 'M005', 'Mentor explained well but the pace was a bit slow.', 'Machine Learning Basics', 'Dr. V. Rao', 'High', 'Moderate', 'High', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(369, 'R369', 'S118', 'C005', 'M003', 'The course lacked structure and was hard to follow.', 'Deep Learning Advanced', 'Ms. R. Sharma', 'High', 'Easy', 'High', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(370, 'R370', 'S128', 'C001', 'M002', 'Good, but not much interaction from the mentor.', 'Python for Beginners', 'Prof. S. Mehta', 'Medium', 'Easy', 'Medium', 'Intermediate', 'good much interaction mentor', 'Positive', 4),
(371, 'R371', 'S106', 'C004', 'M001', 'Content was decent, not too exciting though.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Low', 'Easy', 'High', 'Expert', 'content decent exciting though', 'Positive', 4),
(372, 'R372', 'S140', 'C004', 'M002', 'I didn’t learn as much as I expected.', 'Machine Learning Basics', 'Prof. S. Mehta', 'High', 'Easy', 'Low', 'Intermediate', 'didnt learn much expected', 'Neutral', 3),
(373, 'R373', 'S135', 'C003', 'M005', 'The course content was very informative and the mentor explained clearly.', 'Web Development', 'Dr. V. Rao', 'High', 'Easy', 'Medium', 'Expert', 'course content informative mentor explained clearly', 'Neutral', 3),
(374, 'R374', 'S118', 'C005', 'M001', 'I didn’t learn as much as I expected.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'Low', 'Moderate', 'Low', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(375, 'R375', 'S109', 'C002', 'M002', 'Mentor explained well but the pace was a bit slow.', 'Data Science Fundamentals', 'Prof. S. Mehta', 'High', 'Moderate', 'Low', 'Intermediate', 'mentor explained well pace bit slow', 'Negative', 1),
(376, 'R376', 'S137', 'C003', 'M004', 'Very basic and not engaging enough.', 'Web Development', 'Mr. L. Das', 'Medium', 'Moderate', 'Low', 'Beginner', 'basic engaging enough', 'Neutral', 3),
(377, 'R377', 'S148', 'C003', 'M003', 'The course lacked structure and was hard to follow.', 'Web Development', 'Ms. R. Sharma', 'Medium', 'Moderate', 'Medium', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(378, 'R378', 'S147', 'C001', 'M004', 'The course lacked structure and was hard to follow.', 'Python for Beginners', 'Mr. L. Das', 'High', 'Difficult', 'High', 'Beginner', 'course lacked structure hard follow', 'Negative', 1),
(379, 'R379', 'S126', 'C002', 'M004', 'The course was okay, but could use more real-world examples.', 'Data Science Fundamentals', 'Mr. L. Das', 'Low', 'Moderate', 'Medium', 'Beginner', 'course okay could use realworld example', 'Positive', 4),
(380, 'R380', 'S137', 'C002', 'M005', 'Content was decent, not too exciting though.', 'Data Science Fundamentals', 'Dr. V. Rao', 'Medium', 'Moderate', 'High', 'Expert', 'content decent exciting though', 'Positive', 4),
(381, 'R381', 'S130', 'C001', 'M001', 'The course content was very informative and the mentor explained clearly.', 'Python for Beginners', 'Dr. A. Kumar', 'Low', 'Moderate', 'Medium', 'Expert', 'course content informative mentor explained clearly', 'Neutral', 3),
(382, 'R382', 'S145', 'C002', 'M003', 'Highly recommended! The course structure is great.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'Low', 'Moderate', 'Low', 'Expert', 'highly recommended course structure great', 'Positive', 4),
(383, 'R383', 'S124', 'C002', 'M001', 'I didn’t learn as much as I expected.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'Medium', 'Difficult', 'Medium', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(384, 'R384', 'S106', 'C001', 'M001', 'Mentor did not respond to questions effectively.', 'Python for Beginners', 'Dr. A. Kumar', 'Low', 'Moderate', 'Low', 'Expert', 'mentor respond question effectively', 'Positive', 4),
(385, 'R385', 'S144', 'C004', 'M001', 'Mentor was very supportive and responded quickly.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Low', 'Difficult', 'Medium', 'Expert', 'mentor supportive responded quickly', 'Positive', 4),
(386, 'R386', 'S131', 'C001', 'M002', 'Highly recommended! The course structure is great.', 'Python for Beginners', 'Prof. S. Mehta', 'Medium', 'Easy', 'High', 'Intermediate', 'highly recommended course structure great', 'Positive', 4),
(387, 'R387', 'S120', 'C002', 'M004', 'The course content was very informative and the mentor explained clearly.', 'Data Science Fundamentals', 'Mr. L. Das', 'Low', 'Difficult', 'High', 'Beginner', 'course content informative mentor explained clearly', 'Neutral', 3),
(388, 'R388', 'S101', 'C005', 'M002', 'The course content was very informative and the mentor explained clearly.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'Medium', 'Moderate', 'High', 'Intermediate', 'course content informative mentor explained clearly', 'Neutral', 3),
(389, 'R389', 'S140', 'C004', 'M002', 'Excellent teaching style and very interactive sessions.', 'Machine Learning Basics', 'Prof. S. Mehta', 'Low', 'Easy', 'Low', 'Intermediate', 'excellent teaching style interactive session', 'Positive', 4),
(390, 'R390', 'S123', 'C004', 'M003', 'Mentor was very supportive and responded quickly.', 'Machine Learning Basics', 'Ms. R. Sharma', 'Low', 'Easy', 'Medium', 'Expert', 'mentor supportive responded quickly', 'Positive', 4),
(391, 'R391', 'S139', 'C005', 'M005', 'The course lacked structure and was hard to follow.', 'Deep Learning Advanced', 'Dr. V. Rao', 'Medium', 'Difficult', 'Low', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(392, 'R392', 'S139', 'C005', 'M002', 'I didn’t learn as much as I expected.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'High', 'Moderate', 'Medium', 'Intermediate', 'didnt learn much expected', 'Neutral', 3),
(393, 'R393', 'S116', 'C004', 'M004', 'The course lacked structure and was hard to follow.', 'Machine Learning Basics', 'Mr. L. Das', 'Low', 'Easy', 'Medium', 'Beginner', 'course lacked structure hard follow', 'Negative', 1),
(394, 'R394', 'S101', 'C003', 'M003', 'Too theoretical, needs more practical examples.', 'Web Development', 'Ms. R. Sharma', 'Low', 'Moderate', 'High', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(395, 'R395', 'S112', 'C004', 'M001', 'Content was decent, not too exciting though.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Low', 'Difficult', 'Low', 'Expert', 'content decent exciting though', 'Positive', 4),
(396, 'R396', 'S104', 'C004', 'M005', 'Loved the examples and the mentor’s expertise really shows.', 'Machine Learning Basics', 'Dr. V. Rao', 'Medium', 'Difficult', 'High', 'Expert', 'loved example mentor expertise really show', 'Positive', 4),
(397, 'R397', 'S126', 'C001', 'M005', 'Very basic and not engaging enough.', 'Python for Beginners', 'Dr. V. Rao', 'High', 'Difficult', 'Low', 'Expert', 'basic engaging enough', 'Neutral', 3),
(398, 'R398', 'S133', 'C002', 'M002', 'The course was okay, but could use more real-world examples.', 'Data Science Fundamentals', 'Prof. S. Mehta', 'High', 'Moderate', 'Medium', 'Intermediate', 'course okay could use realworld example', 'Positive', 4),
(399, 'R399', 'S128', 'C002', 'M001', 'The course lacked structure and was hard to follow.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'Low', 'Easy', 'Medium', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(400, 'R400', 'S104', 'C003', 'M002', 'Highly recommended! The course structure is great.', 'Web Development', 'Prof. S. Mehta', 'Low', 'Easy', 'High', 'Intermediate', 'highly recommended course structure great', 'Positive', 4),
(401, 'R401', 'S123', 'C005', 'M005', 'The course content was very informative and the mentor explained clearly.', 'Deep Learning Advanced', 'Dr. V. Rao', 'High', 'Moderate', 'Low', 'Expert', 'course content informative mentor explained clearly', 'Neutral', 3),
(402, 'R402', 'S118', 'C001', 'M001', 'Mentor explained well but the pace was a bit slow.', 'Python for Beginners', 'Dr. A. Kumar', 'Medium', 'Moderate', 'Medium', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(403, 'R403', 'S137', 'C001', 'M004', 'The course lacked structure and was hard to follow.', 'Python for Beginners', 'Mr. L. Das', 'Medium', 'Difficult', 'Medium', 'Beginner', 'course lacked structure hard follow', 'Negative', 1),
(404, 'R404', 'S111', 'C003', 'M002', 'Highly recommended! The course structure is great.', 'Web Development', 'Prof. S. Mehta', 'Medium', 'Easy', 'High', 'Intermediate', 'highly recommended course structure great', 'Positive', 4),
(405, 'R405', 'S133', 'C001', 'M001', 'The course lacked structure and was hard to follow.', 'Python for Beginners', 'Dr. A. Kumar', 'Low', 'Easy', 'Low', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(406, 'R406', 'S110', 'C002', 'M001', 'Content was decent, not too exciting though.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'High', 'Difficult', 'High', 'Expert', 'content decent exciting though', 'Positive', 4),
(407, 'R407', 'S116', 'C004', 'M003', 'Very basic and not engaging enough.', 'Machine Learning Basics', 'Ms. R. Sharma', 'Medium', 'Easy', 'High', 'Expert', 'basic engaging enough', 'Neutral', 3),
(408, 'R408', 'S104', 'C002', 'M002', 'The course was okay, but could use more real-world examples.', 'Data Science Fundamentals', 'Prof. S. Mehta', 'High', 'Easy', 'Medium', 'Intermediate', 'course okay could use realworld example', 'Positive', 4),
(409, 'R409', 'S150', 'C003', 'M003', 'Highly recommended! The course structure is great.', 'Web Development', 'Ms. R. Sharma', 'Low', 'Difficult', 'Medium', 'Expert', 'highly recommended course structure great', 'Positive', 4),
(410, 'R410', 'S137', 'C003', 'M005', 'Loved the examples and the mentor’s expertise really shows.', 'Web Development', 'Dr. V. Rao', 'Low', 'Moderate', 'Medium', 'Expert', 'loved example mentor expertise really show', 'Positive', 4),
(411, 'R411', 'S150', 'C002', 'M005', 'Very basic and not engaging enough.', 'Data Science Fundamentals', 'Dr. V. Rao', 'Low', 'Easy', 'Low', 'Expert', 'basic engaging enough', 'Neutral', 3),
(412, 'R412', 'S123', 'C001', 'M003', 'The course was okay, but could use more real-world examples.', 'Python for Beginners', 'Ms. R. Sharma', 'Low', 'Difficult', 'Medium', 'Expert', 'course okay could use realworld example', 'Positive', 4),
(413, 'R413', 'S134', 'C002', 'M004', 'I didn’t learn as much as I expected.', 'Data Science Fundamentals', 'Mr. L. Das', 'Medium', 'Easy', 'Low', 'Beginner', 'didnt learn much expected', 'Neutral', 3),
(414, 'R414', 'S115', 'C005', 'M004', 'I didn’t learn as much as I expected.', 'Deep Learning Advanced', 'Mr. L. Das', 'High', 'Moderate', 'Medium', 'Beginner', 'didnt learn much expected', 'Neutral', 3),
(415, 'R415', 'S133', 'C002', 'M004', 'The course lacked structure and was hard to follow.', 'Data Science Fundamentals', 'Mr. L. Das', 'Low', 'Difficult', 'High', 'Beginner', 'course lacked structure hard follow', 'Negative', 1),
(416, 'R416', 'S109', 'C002', 'M003', 'Highly recommended! The course structure is great.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'Medium', 'Moderate', 'Medium', 'Expert', 'highly recommended course structure great', 'Positive', 4),
(417, 'R417', 'S118', 'C002', 'M001', 'I didn’t learn as much as I expected.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'Low', 'Easy', 'High', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(418, 'R418', 'S129', 'C004', 'M003', 'Excellent teaching style and very interactive sessions.', 'Machine Learning Basics', 'Ms. R. Sharma', 'Medium', 'Easy', 'High', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(419, 'R419', 'S130', 'C003', 'M001', 'Mentor explained well but the pace was a bit slow.', 'Web Development', 'Dr. A. Kumar', 'Low', 'Easy', 'High', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(420, 'R420', 'S121', 'C002', 'M001', 'Good, but not much interaction from the mentor.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'High', 'Easy', 'Medium', 'Expert', 'good much interaction mentor', 'Positive', 4),
(421, 'R421', 'S120', 'C003', 'M002', 'Good, but not much interaction from the mentor.', 'Web Development', 'Prof. S. Mehta', 'Low', 'Moderate', 'Medium', 'Intermediate', 'good much interaction mentor', 'Positive', 4),
(422, 'R422', 'S130', 'C001', 'M002', 'Too theoretical, needs more practical examples.', 'Python for Beginners', 'Prof. S. Mehta', 'Low', 'Easy', 'Low', 'Intermediate', 'theoretical need practical example', 'Neutral', 3),
(423, 'R423', 'S126', 'C003', 'M001', 'Excellent teaching style and very interactive sessions.', 'Web Development', 'Dr. A. Kumar', 'High', 'Difficult', 'Medium', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(424, 'R424', 'S113', 'C004', 'M002', 'The course content was very informative and the mentor explained clearly.', 'Machine Learning Basics', 'Prof. S. Mehta', 'Low', 'Moderate', 'Low', 'Intermediate', 'course content informative mentor explained clearly', 'Neutral', 3),
(425, 'R425', 'S137', 'C004', 'M004', 'Highly recommended! The course structure is great.', 'Machine Learning Basics', 'Mr. L. Das', 'Medium', 'Easy', 'Medium', 'Beginner', 'highly recommended course structure great', 'Positive', 4),
(426, 'R426', 'S114', 'C002', 'M003', 'Very basic and not engaging enough.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'Medium', 'Moderate', 'Low', 'Expert', 'basic engaging enough', 'Neutral', 3),
(427, 'R427', 'S116', 'C003', 'M004', 'Mentor was very supportive and responded quickly.', 'Web Development', 'Mr. L. Das', 'Medium', 'Difficult', 'Medium', 'Beginner', 'mentor supportive responded quickly', 'Positive', 4),
(428, 'R428', 'S109', 'C004', 'M002', 'The course content was very informative and the mentor explained clearly.', 'Machine Learning Basics', 'Prof. S. Mehta', 'High', 'Difficult', 'Low', 'Intermediate', 'course content informative mentor explained clearly', 'Neutral', 3),
(429, 'R429', 'S125', 'C003', 'M004', 'Too theoretical, needs more practical examples.', 'Web Development', 'Mr. L. Das', 'High', 'Moderate', 'Medium', 'Beginner', 'theoretical need practical example', 'Neutral', 3),
(430, 'R430', 'S118', 'C002', 'M001', 'Too theoretical, needs more practical examples.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'Medium', 'Difficult', 'Low', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(431, 'R431', 'S131', 'C005', 'M003', 'Loved the examples and the mentor’s expertise really shows.', 'Deep Learning Advanced', 'Ms. R. Sharma', 'High', 'Easy', 'Low', 'Expert', 'loved example mentor expertise really show', 'Positive', 4),
(432, 'R432', 'S118', 'C005', 'M001', 'Excellent teaching style and very interactive sessions.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'Low', 'Difficult', 'Medium', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(433, 'R433', 'S138', 'C003', 'M003', 'Mentor explained well but the pace was a bit slow.', 'Web Development', 'Ms. R. Sharma', 'High', 'Easy', 'High', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(434, 'R434', 'S137', 'C002', 'M005', 'I didn’t learn as much as I expected.', 'Data Science Fundamentals', 'Dr. V. Rao', 'Low', 'Moderate', 'High', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(435, 'R435', 'S106', 'C001', 'M002', 'Mentor explained well but the pace was a bit slow.', 'Python for Beginners', 'Prof. S. Mehta', 'High', 'Easy', 'Low', 'Intermediate', 'mentor explained well pace bit slow', 'Negative', 1),
(436, 'R436', 'S140', 'C002', 'M002', 'Very basic and not engaging enough.', 'Data Science Fundamentals', 'Prof. S. Mehta', 'Medium', 'Difficult', 'Low', 'Intermediate', 'basic engaging enough', 'Neutral', 3),
(437, 'R437', 'S138', 'C002', 'M001', 'The course was okay, but could use more real-world examples.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'High', 'Moderate', 'Low', 'Expert', 'course okay could use realworld example', 'Positive', 4),
(438, 'R438', 'S122', 'C003', 'M003', 'Some topics were covered in depth, others were rushed.', 'Web Development', 'Ms. R. Sharma', 'Low', 'Easy', 'High', 'Expert', 'topic covered depth others rushed', 'Neutral', 3),
(439, 'R439', 'S112', 'C005', 'M005', 'Some topics were covered in depth, others were rushed.', 'Deep Learning Advanced', 'Dr. V. Rao', 'Medium', 'Easy', 'High', 'Expert', 'topic covered depth others rushed', 'Neutral', 3),
(440, 'R440', 'S147', 'C003', 'M002', 'Mentor did not respond to questions effectively.', 'Web Development', 'Prof. S. Mehta', 'Low', 'Difficult', 'Low', 'Intermediate', 'mentor respond question effectively', 'Positive', 4),
(441, 'R441', 'S150', 'C005', 'M001', 'Too theoretical, needs more practical examples.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'Low', 'Difficult', 'Medium', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(442, 'R442', 'S107', 'C004', 'M002', 'Mentor did not respond to questions effectively.', 'Machine Learning Basics', 'Prof. S. Mehta', 'Medium', 'Difficult', 'Low', 'Intermediate', 'mentor respond question effectively', 'Positive', 4),
(443, 'R443', 'S111', 'C001', 'M003', 'Loved the examples and the mentor’s expertise really shows.', 'Python for Beginners', 'Ms. R. Sharma', 'Medium', 'Easy', 'Medium', 'Expert', 'loved example mentor expertise really show', 'Positive', 4);
INSERT INTO `ci_review_data` (`id`, `review_id`, `student_id`, `course_id`, `mentor_id`, `review_text`, `course_name`, `mentor_name`, `engagement`, `difficulty`, `relevance`, `expertise`, `processed_review`, `sentiment`, `estimated_rating`) VALUES
(444, 'R444', 'S123', 'C003', 'M001', 'Excellent teaching style and very interactive sessions.', 'Web Development', 'Dr. A. Kumar', 'High', 'Easy', 'Low', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(445, 'R445', 'S111', 'C004', 'M004', 'Some topics were covered in depth, others were rushed.', 'Machine Learning Basics', 'Mr. L. Das', 'Medium', 'Moderate', 'High', 'Beginner', 'topic covered depth others rushed', 'Neutral', 3),
(446, 'R446', 'S137', 'C002', 'M002', 'The course was okay, but could use more real-world examples.', 'Data Science Fundamentals', 'Prof. S. Mehta', 'Medium', 'Easy', 'Low', 'Intermediate', 'course okay could use realworld example', 'Positive', 4),
(447, 'R447', 'S107', 'C001', 'M003', 'The course was okay, but could use more real-world examples.', 'Python for Beginners', 'Ms. R. Sharma', 'Low', 'Moderate', 'Low', 'Expert', 'course okay could use realworld example', 'Positive', 4),
(448, 'R448', 'S106', 'C003', 'M005', 'The course lacked structure and was hard to follow.', 'Web Development', 'Dr. V. Rao', 'High', 'Moderate', 'High', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(449, 'R449', 'S111', 'C005', 'M004', 'Highly recommended! The course structure is great.', 'Deep Learning Advanced', 'Mr. L. Das', 'Low', 'Easy', 'Low', 'Beginner', 'highly recommended course structure great', 'Positive', 4),
(450, 'R450', 'S127', 'C005', 'M005', 'Mentor explained well but the pace was a bit slow.', 'Deep Learning Advanced', 'Dr. V. Rao', 'Medium', 'Difficult', 'Medium', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(451, 'R451', 'S126', 'C005', 'M005', 'Mentor explained well but the pace was a bit slow.', 'Deep Learning Advanced', 'Dr. V. Rao', 'Medium', 'Easy', 'Low', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(452, 'R452', 'S119', 'C005', 'M004', 'The course was okay, but could use more real-world examples.', 'Deep Learning Advanced', 'Mr. L. Das', 'Low', 'Easy', 'Low', 'Beginner', 'course okay could use realworld example', 'Positive', 4),
(453, 'R453', 'S106', 'C004', 'M001', 'Excellent teaching style and very interactive sessions.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Medium', 'Moderate', 'Medium', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(454, 'R454', 'S135', 'C004', 'M002', 'Content was decent, not too exciting though.', 'Machine Learning Basics', 'Prof. S. Mehta', 'Medium', 'Moderate', 'Medium', 'Intermediate', 'content decent exciting though', 'Positive', 4),
(455, 'R455', 'S129', 'C004', 'M003', 'Highly recommended! The course structure is great.', 'Machine Learning Basics', 'Ms. R. Sharma', 'Low', 'Moderate', 'High', 'Expert', 'highly recommended course structure great', 'Positive', 4),
(456, 'R456', 'S143', 'C001', 'M001', 'Excellent teaching style and very interactive sessions.', 'Python for Beginners', 'Dr. A. Kumar', 'High', 'Moderate', 'High', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(457, 'R457', 'S104', 'C004', 'M005', 'Good, but not much interaction from the mentor.', 'Machine Learning Basics', 'Dr. V. Rao', 'Medium', 'Difficult', 'High', 'Expert', 'good much interaction mentor', 'Positive', 4),
(458, 'R458', 'S131', 'C003', 'M001', 'Good, but not much interaction from the mentor.', 'Web Development', 'Dr. A. Kumar', 'Medium', 'Difficult', 'Low', 'Expert', 'good much interaction mentor', 'Positive', 4),
(459, 'R459', 'S137', 'C005', 'M002', 'Too theoretical, needs more practical examples.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'Low', 'Moderate', 'Low', 'Intermediate', 'theoretical need practical example', 'Neutral', 3),
(460, 'R460', 'S109', 'C001', 'M004', 'Excellent teaching style and very interactive sessions.', 'Python for Beginners', 'Mr. L. Das', 'Low', 'Difficult', 'Medium', 'Beginner', 'excellent teaching style interactive session', 'Positive', 4),
(461, 'R461', 'S117', 'C003', 'M001', 'Excellent teaching style and very interactive sessions.', 'Web Development', 'Dr. A. Kumar', 'Low', 'Moderate', 'High', 'Expert', 'excellent teaching style interactive session', 'Positive', 4),
(462, 'R462', 'S118', 'C005', 'M004', 'Good, but not much interaction from the mentor.', 'Deep Learning Advanced', 'Mr. L. Das', 'Low', 'Difficult', 'High', 'Beginner', 'good much interaction mentor', 'Positive', 4),
(463, 'R463', 'S108', 'C004', 'M002', 'Too theoretical, needs more practical examples.', 'Machine Learning Basics', 'Prof. S. Mehta', 'Low', 'Difficult', 'High', 'Intermediate', 'theoretical need practical example', 'Neutral', 3),
(464, 'R464', 'S137', 'C001', 'M003', 'The course lacked structure and was hard to follow.', 'Python for Beginners', 'Ms. R. Sharma', 'High', 'Moderate', 'Medium', 'Expert', 'course lacked structure hard follow', 'Negative', 1),
(465, 'R465', 'S137', 'C005', 'M004', 'Some topics were covered in depth, others were rushed.', 'Deep Learning Advanced', 'Mr. L. Das', 'Low', 'Easy', 'Medium', 'Beginner', 'topic covered depth others rushed', 'Neutral', 3),
(466, 'R466', 'S144', 'C004', 'M001', 'Mentor explained well but the pace was a bit slow.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Medium', 'Moderate', 'High', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(467, 'R467', 'S118', 'C003', 'M001', 'The course content was very informative and the mentor explained clearly.', 'Web Development', 'Dr. A. Kumar', 'Medium', 'Moderate', 'Medium', 'Expert', 'course content informative mentor explained clearly', 'Neutral', 3),
(468, 'R468', 'S144', 'C001', 'M002', 'Some topics were covered in depth, others were rushed.', 'Python for Beginners', 'Prof. S. Mehta', 'Low', 'Moderate', 'High', 'Intermediate', 'topic covered depth others rushed', 'Neutral', 3),
(469, 'R469', 'S127', 'C005', 'M001', 'Content was decent, not too exciting though.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'Low', 'Moderate', 'Low', 'Expert', 'content decent exciting though', 'Positive', 4),
(470, 'R470', 'S124', 'C001', 'M005', 'Some topics were covered in depth, others were rushed.', 'Python for Beginners', 'Dr. V. Rao', 'Low', 'Easy', 'Medium', 'Expert', 'topic covered depth others rushed', 'Neutral', 3),
(471, 'R471', 'S150', 'C005', 'M005', 'Too theoretical, needs more practical examples.', 'Deep Learning Advanced', 'Dr. V. Rao', 'Low', 'Easy', 'Low', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(472, 'R472', 'S130', 'C001', 'M003', 'The course content was very informative and the mentor explained clearly.', 'Python for Beginners', 'Ms. R. Sharma', 'High', 'Easy', 'Medium', 'Expert', 'course content informative mentor explained clearly', 'Neutral', 3),
(473, 'R473', 'S141', 'C001', 'M001', 'Some topics were covered in depth, others were rushed.', 'Python for Beginners', 'Dr. A. Kumar', 'Low', 'Moderate', 'Medium', 'Expert', 'topic covered depth others rushed', 'Neutral', 3),
(474, 'R474', 'S131', 'C005', 'M005', 'Very basic and not engaging enough.', 'Deep Learning Advanced', 'Dr. V. Rao', 'Medium', 'Moderate', 'Low', 'Expert', 'basic engaging enough', 'Neutral', 3),
(475, 'R475', 'S125', 'C001', 'M002', 'The course was okay, but could use more real-world examples.', 'Python for Beginners', 'Prof. S. Mehta', 'High', 'Easy', 'Low', 'Intermediate', 'course okay could use realworld example', 'Positive', 4),
(476, 'R476', 'S118', 'C004', 'M005', 'Mentor did not respond to questions effectively.', 'Machine Learning Basics', 'Dr. V. Rao', 'Low', 'Difficult', 'Low', 'Expert', 'mentor respond question effectively', 'Positive', 4),
(477, 'R477', 'S139', 'C001', 'M002', 'Mentor explained well but the pace was a bit slow.', 'Python for Beginners', 'Prof. S. Mehta', 'Medium', 'Difficult', 'Medium', 'Intermediate', 'mentor explained well pace bit slow', 'Negative', 1),
(478, 'R478', 'S125', 'C003', 'M004', 'I didn’t learn as much as I expected.', 'Web Development', 'Mr. L. Das', 'Medium', 'Easy', 'Medium', 'Beginner', 'didnt learn much expected', 'Neutral', 3),
(479, 'R479', 'S126', 'C005', 'M001', 'Good, but not much interaction from the mentor.', 'Deep Learning Advanced', 'Dr. A. Kumar', 'Low', 'Difficult', 'High', 'Expert', 'good much interaction mentor', 'Positive', 4),
(480, 'R480', 'S139', 'C003', 'M003', 'Good, but not much interaction from the mentor.', 'Web Development', 'Ms. R. Sharma', 'High', 'Easy', 'Medium', 'Expert', 'good much interaction mentor', 'Positive', 4),
(481, 'R481', 'S141', 'C003', 'M003', 'Loved the examples and the mentor’s expertise really shows.', 'Web Development', 'Ms. R. Sharma', 'Medium', 'Difficult', 'High', 'Expert', 'loved example mentor expertise really show', 'Positive', 4),
(482, 'R482', 'S134', 'C002', 'M001', 'I didn’t learn as much as I expected.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'High', 'Moderate', 'High', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(483, 'R483', 'S142', 'C004', 'M003', 'Mentor explained well but the pace was a bit slow.', 'Machine Learning Basics', 'Ms. R. Sharma', 'Medium', 'Moderate', 'Medium', 'Expert', 'mentor explained well pace bit slow', 'Negative', 1),
(484, 'R484', 'S137', 'C002', 'M003', 'The course was okay, but could use more real-world examples.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'High', 'Difficult', 'Low', 'Expert', 'course okay could use realworld example', 'Positive', 4),
(485, 'R485', 'S131', 'C003', 'M005', 'Too theoretical, needs more practical examples.', 'Web Development', 'Dr. V. Rao', 'Medium', 'Easy', 'High', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(486, 'R486', 'S131', 'C002', 'M003', 'Mentor did not respond to questions effectively.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'High', 'Difficult', 'Low', 'Expert', 'mentor respond question effectively', 'Positive', 4),
(487, 'R487', 'S115', 'C003', 'M002', 'I didn’t learn as much as I expected.', 'Web Development', 'Prof. S. Mehta', 'High', 'Moderate', 'Medium', 'Intermediate', 'didnt learn much expected', 'Neutral', 3),
(488, 'R488', 'S119', 'C004', 'M001', 'Content was decent, not too exciting though.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Medium', 'Easy', 'High', 'Expert', 'content decent exciting though', 'Positive', 4),
(489, 'R489', 'S105', 'C004', 'M002', 'Too theoretical, needs more practical examples.', 'Machine Learning Basics', 'Prof. S. Mehta', 'High', 'Easy', 'High', 'Intermediate', 'theoretical need practical example', 'Neutral', 3),
(490, 'R490', 'S104', 'C002', 'M002', 'Good, but not much interaction from the mentor.', 'Data Science Fundamentals', 'Prof. S. Mehta', 'Low', 'Moderate', 'Medium', 'Intermediate', 'good much interaction mentor', 'Positive', 4),
(491, 'R491', 'S146', 'C002', 'M001', 'Very basic and not engaging enough.', 'Data Science Fundamentals', 'Dr. A. Kumar', 'Medium', 'Moderate', 'High', 'Expert', 'basic engaging enough', 'Neutral', 3),
(492, 'R492', 'S101', 'C004', 'M003', 'Loved the examples and the mentor’s expertise really shows.', 'Machine Learning Basics', 'Ms. R. Sharma', 'Low', 'Easy', 'High', 'Expert', 'loved example mentor expertise really show', 'Positive', 4),
(493, 'R493', 'S150', 'C001', 'M002', 'Highly recommended! The course structure is great.', 'Python for Beginners', 'Prof. S. Mehta', 'High', 'Moderate', 'High', 'Intermediate', 'highly recommended course structure great', 'Positive', 4),
(494, 'R494', 'S131', 'C004', 'M001', 'Some topics were covered in depth, others were rushed.', 'Machine Learning Basics', 'Dr. A. Kumar', 'Low', 'Difficult', 'Low', 'Expert', 'topic covered depth others rushed', 'Neutral', 3),
(495, 'R495', 'S121', 'C005', 'M002', 'I didn’t learn as much as I expected.', 'Deep Learning Advanced', 'Prof. S. Mehta', 'Low', 'Difficult', 'Low', 'Intermediate', 'didnt learn much expected', 'Neutral', 3),
(496, 'R496', 'S123', 'C003', 'M002', 'Mentor did not respond to questions effectively.', 'Web Development', 'Prof. S. Mehta', 'Low', 'Moderate', 'High', 'Intermediate', 'mentor respond question effectively', 'Positive', 4),
(497, 'R497', 'S103', 'C003', 'M003', 'I didn’t learn as much as I expected.', 'Web Development', 'Ms. R. Sharma', 'Medium', 'Difficult', 'High', 'Expert', 'didnt learn much expected', 'Neutral', 3),
(498, 'R498', 'S144', 'C002', 'M003', 'Too theoretical, needs more practical examples.', 'Data Science Fundamentals', 'Ms. R. Sharma', 'Medium', 'Moderate', 'Low', 'Expert', 'theoretical need practical example', 'Neutral', 3),
(499, 'R499', 'S115', 'C002', 'M002', 'Highly recommended! The course structure is great.', 'Data Science Fundamentals', 'Prof. S. Mehta', 'High', 'Easy', 'High', 'Intermediate', 'highly recommended course structure great', 'Positive', 4),
(500, 'R500', 'S146', 'C001', 'M004', 'Mentor did not respond to questions effectively.', 'Python for Beginners', 'Mr. L. Das', 'High', 'Moderate', 'High', 'Beginner', 'mentor respond question effectively', 'Positive', 4);

-- --------------------------------------------------------

--
-- Table structure for table `ci_student`
--

CREATE TABLE `ci_student` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `location` varchar(40) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `photo` varchar(20) NOT NULL,
  `rdate` varchar(15) NOT NULL,
  `status` int(11) NOT NULL,
  `question` varchar(200) NOT NULL,
  `eid` int(11) NOT NULL,
  `attend` int(11) NOT NULL,
  `seconds` int(11) NOT NULL,
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_student`
--

INSERT INTO `ci_student` (`id`, `name`, `mobile`, `email`, `location`, `uname`, `pass`, `photo`, `rdate`, `status`, `question`, `eid`, `attend`, `seconds`) VALUES
(1, 'Dinesh', 8956232154, 'dinesh@gmail.com', 'Madurai', 'S105', '1234', '', '03-02-2025', 1, '7,4,10,8,3', 1, 96, 60),
(4, 'Mahesh', 8856977425, 'mahesh@gmail.com', 'Chennai', 'S112', '123456', '', '18-02-2025', 1, '9,3,1,8,6', 1, 0, 0),
(5, 'Mani', 9638527415, 'mani@gmail.com', 'GG Nagar', 'S118', '123456', '', '20-02-2025', 0, '', 0, 0, 0),
(3, 'Radha', 8865977254, 'radha@gmail.com', 'Madurai', 'S110', '1234', '', '17-02-2025', 1, '', 0, 0, 0),
(2, 'Raj', 9360967387, 'raj@gmail.com', 'Trichy', 'S106', '1234', '', '07-02-2025', 1, '8,2,1,3,10', 1, 0, 0),
(6, 'Subash', 9638521595, 'subash@gmail.com', 'Madurai', 'S119', '1234', '', '02-03-2025', 0, '2,10,9,4,5', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ci_temp`
--

CREATE TABLE `ci_temp` (
  `id` int(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `eid` int(11) NOT NULL,
  `question` varchar(200) NOT NULL,
  `cans` varchar(100) NOT NULL,
  `uans` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_temp`
--

INSERT INTO `ci_temp` (`id`, `uname`, `eid`, `question`, `cans`, `uans`) VALUES
(1, 'S105', 1, 'Function', 'Fun', 'Fun'),
(2, 'S105', 1, 'Is Python code compiled or interpreted?', 'Python code is both compiled and interpreted', 'Python code is both compiled and interpreted'),
(3, 'S105', 1, 'What does pip stand for python?', 'Preferred Installer Program', 'Preferred Installer Program'),
(4, 'S105', 1, 'Which of the following character is used to give single-line comments in Python?', '#', '#'),
(5, 'S105', 1, 'Which of the following is the correct extension of the Python file?', '.py', '.py');

-- --------------------------------------------------------

--
-- Table structure for table `ci_tutorial`
--

CREATE TABLE `ci_tutorial` (
  `id` int(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `cid` int(11) NOT NULL,
  `course` varchar(30) NOT NULL,
  `details` varchar(100) NOT NULL,
  `filename` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_tutorial`
--

INSERT INTO `ci_tutorial` (`id`, `uname`, `cid`, `course`, `details`, `filename`) VALUES
(1, 'M001', 1, 'Python', 'Basics', 'T1hh2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ci_user`
--

CREATE TABLE `ci_user` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `location` varchar(40) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `photo` varchar(20) NOT NULL,
  `rdate` varchar(15) NOT NULL,
  `status` int(11) NOT NULL,
  `qualification` varchar(30) NOT NULL,
  `skills` varchar(100) NOT NULL,
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_user`
--

INSERT INTO `ci_user` (`id`, `name`, `mobile`, `email`, `location`, `uname`, `pass`, `photo`, `rdate`, `status`, `qualification`, `skills`) VALUES
(4, 'Mr. L. Das', 9895454585, 'das14@gmail.com', 'Chennai', 'M004', '1234', '', '04-04-2025', 1, 'ME', ''),
(1, 'Dr. A. Kumar', 8248656967, 'kumar@gmail.com', 'Madurai', 'M001', '1234', 'P1face21.jpg', '15-02-2025', 1, 'M.Tech', 'Python,PHP'),
(2, 'Prof. S. Mehta', 7852398521, 'mehta@gmail.com', 'Chennai', 'M002', '1234', '', '21-02-2025', 1, 'ME', ''),
(5, 'Dr. V. Rao', 8755244751, 'rao55@gmail.com', 'Salem', 'M005', '1234', '', '04-04-2025', 1, 'M.Phil', ''),
(3, 'Ms. R. Sharma', 8946545451, 'sharma25@gmail.com', 'Madurai', 'M003', '1234', '', '04-04-2025', 1, 'M.Tech', '');
