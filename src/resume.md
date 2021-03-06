-@layout="resume"
#banner
  .left
    %h1 Ryan Mulligan
    %h2
      %a{:href=>"mailto:ryan@ryantm.com"}ryan@ryantm.com
  .right
    %a{:href=>"http://www.ryantm.com"}Ryan Mulligan's Website
  .clear

%h2 Education
%hr/
.item
  .dates
    Graduated December 2007
  .info
    University of Illinois at Urbana-Champaign
    %br/
    B.S. in <strong>General Engineering</strong> with Highest Honors,
    %br/
    Concentration in <strong>Operations Research</strong>
    %br/
    and Minor in <strong>Mathematics</strong>
    %br/
    GPA: 3.91/4.0


%h2 Skills
%hr/
.item
  .dates
  .info
    %b Web
    (HTML, CSS, Javascript, Rails, Linux)
.item
  .dates
  .info
    %b Programming
    (C, C#, Java, Ruby, Javascript, SQL)
.item
  .dates
  .info
    %b Version Control
    (Git)
.item
  .dates
  .info
    %b Marketing
    (search engine optimization)
.item
  .dates
  .info
    %b Manufacturing
    (surface-mount assembly, electronics assembly, laser cutting)
.item
  .dates
  .info
    %b Language
    (English)
.item
  .dates
  .info
    %b Mathematics
    (calculus, differential, linear algebra, probability, statistics)
.item
  .dates
  .info
    %b Control Systems
    (analog, digital)
.item
  .dates
  .info
    %b Computer Aided Design
    (Altium)
.item
  .dates
  .info
    %b Electrical Engineering
    (digital circuits, embedded, electrical testing)
.item
  .dates
  .info
    %b Photography
    (product photography)

%h2 Experience
%hr/
.item
  .dates
    Nov 08 &mdash; Present
  .info
    %h3
      Systems Engineer &mdash;
      =link_to "Pololu Corporation", "http://www.pololu.com"
    %ul
      %li
        Wrote over 1000 customer support forum posts
      %li
        Trained surface-mount assembly machine operators
      %li
        Built electrical testing devices for motor drivers with powers exceeding 15 amps and 50 volts
      %li
        Programmed custom enterprise resource planning software
      %li
        Photographed hundreds of products for sale on Pololu's website
.item
  .dates
    Aug 06 &mdash; Present
  .info
    %h3
      President &mdash;
      Grayson Mulligan Incorporated
    %ul
      %li
        Created and managed a web-based
        -link = "http://www.sassins.com"
        ==#{link_to "assassins game hosting service", link};
        hosting games for over <b>1800 players from 3 different countries</b>
      %li==Created a Smash Bros. Brawl Screenshot Gallery, a website that hosted over 120,000 images, averaging 2,000 visitors per day for a popular Nintendo Wii game
      %li==Programmed Adobe Flash to create a streaming voice/video server using HaXe to distribute real-time video to website visitors
      %li
        Created an
        -link = "http://www.replylater.com"
        %a{:href=>link, :title=>link} email reminder service
.item
  .dates
    Aug 07  &mdash; Dec 07
  .info
    %h3
      Programmer &mdash;
      -link = "http://www.patterninsight.com"
      %a{:href=>link, :title=>link} Pattern Insight
    %ul
      %li Created web interface to Pattern Insight's sophisticated code duplication analysis tools
      %li Developed services in a distributed service architecture to help scale to billions of lines of code
      %li Programmed Java Servlet Pages using model-view-controller paradigm
.item
  .dates
    Aug 07  &mdash; Dec 07
  .info
    %h3
      Independent Contractor &mdash;
      -link = "http://honeywell.com"
      %a{:href=>link, :title=>link} Honeywell International
    %ul
      %li
        Designed comprehensive plan to bring Department of Transportation bottle retesting in house to Danville Works Facility saving
        %b $451,381 per year
.item
  .dates
    May 07  &mdash; Aug 07
  .info
    %h3
      Quality Engineer (Intern)  &mdash;
      -link = "http://cat.com"
      %a{:href=>link, :title=>link} Caterpillar Inc.
    %ul
      %li Programed tools in Microsoft Visual Basic freeing 10 man hours per week
      %li Led initiative to clean paint line, resulting in 20% reduction of operator foot travel in masking section
.item
  .dates
    May 06  &mdash; Aug 06
  .info
    %h3
      Manufacturing Engineer (Intern)  &mdash;
      -link = "http://cat.com"
      %a{:href=>link, :title=>link} Caterpillar Inc.
    %ul
      %li Planned, and implemented entirely new assembly process for Medium Wheel Loader axles
      %li Acted in the capacity of senior manufacturing specialist in the absence of one
.item
  .dates
    Feb 05  &mdash; Aug 05
  .info
    %h3
      Branch Manager  &mdash;
      -link = "http://collegeworkspainting.com"
      %a{:href=>link, :title=>link} College Works Painting
    %ul
      %li
        Created, developed, and managed an exterior painting business grossing
        %b $60,321
      %li Learned marketing, sales, management, leadership and self-awareness
.item
  .dates
    Aug 04 &mdash;  Aug 06
  .info
    %h3
      Math Mentor  &mdash;
      -link = "http://www.netmath.uiuc.edu"
      %a{:href=>link, :title=>link} UIUC NetMath
    %ul
      %li
        Mentored twenty five students resulting in their completion of calculus, differential equations, and linear algebra


%h2 Other Leadership Experience
%hr/
.item
  .dates
    July 11 — July 12
  .info
    %h3 Powerhouse Pros Toastmasters President
    %ul
      %li Lead club to President's Distinguished, the highest club award given by Toastmasters International
      %li Conducted club business in Robert's Rules fashion
.item
  .dates
    July 10 — July 11
  .info
    %h3 Powerhouse Pros Toastmasters Vice President of Education
    %ul
      %li Prepared agendas for meetings 3 times a month
      %li Chaired speech contest
      %li Ensured club was President's Distinguished, the highest club award given by Toastmasters International

%h2 Awards
%hr/
.item
  .dates
    Spring 07
  .info
    -link="http://media.www.dailyillini.com/media/storage/paper736/news/2007/04/16/News/Google.Games.Combine.Fun.With.Opportunity-2843098.shtml"
    %a{:href=>link, :title=>link} 1st place team, Google Games Competition, UIUC
.item
  .dates
    Apr 06 — Present
  .info
    -link="http://tbp.org"
    %a{:href=>link, :title=>link} Tau Beta Pi
.item
  .dates
    Aug 04 — Dec 07
  .info
    -link="http://www.engr.uiuc.edu/Academic/hand/hbook96.rules.html#dean"
    %a{:href=>link, :title=>link} Dean's List (all semesters)
.item
  .dates
    Aug 04 — Dec 07
  .info
    -link="http://www.honors.uiuc.edu/?q=about"
    %a{:href=>link, :title=>link} Chancellor's Scholar

%h2 Leisure/Interests
%hr/
.item
  .dates
  .info
    -link="http://www.toastmasters.org"
    %a{:href=>link, :title=>link} Toastmasters
  .dates
  .info
    Reading

.footer