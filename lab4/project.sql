PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Team(
    teamID INTEGER PRIMARY KEY AUTOINCREMENT,
    teamName VARCHAR(255) NOT NULL,
    LeagueName VARCHAR(255) NOT NULL,
    teamWinNo INT NULL,
    teamCupNo INT NULL,
    teamLoseNo INT NULL,
    PenaltyNo INT NULL,
    Salary REAL NULL,
    teamInjuryNo INT NULL,
    UNIQUE(teamName,LeagueName)
);
INSERT INTO Team VALUES(1,'Barcelona','Laliga',600,74,200,100,13799999.999999999999,10);
INSERT INTO Team VALUES(2,'Liverpool','Premier',500,40,210,30,9000000.0,10);
INSERT INTO Team VALUES(3,'Ajax','Eredivisie',450,35,130,40,5000000.0,20);
INSERT INTO Team VALUES(4,'Real Madrid','Laliga',620,91,178,150,20000000.0,34);
INSERT INTO Team VALUES(5,'Juventus','Serie A',537,63,230,67,11799999.999999999999,41);
INSERT INTO Team VALUES(6,'Manchester United','Premier',591,72,201,76,10800000.0,51);
INSERT INTO Team VALUES(7,'Paris Saint-Germain','Ligue 1',478,51,183,68,20799999.999999999999,23);
INSERT INTO Team VALUES(8,'Manchester City','Premier',501,69,209,63,12799999.999999999999,41);
INSERT INTO Team VALUES(9,'Chelsea','Premier',596,71,203,71,8000000.0,30);
INSERT INTO Team VALUES(10,'FC Bayern Munich','Bundesliga',598,74,200,86,12999999.999999999999,47);
INSERT INTO Team VALUES(11,'Borussia Dortmund','Bundesliga',421,62,217,106,9000000.0,43);
INSERT INTO Team VALUES(12,'Atlético Madrid','Laliga',432,53,267,101,10000000.0,36);
INSERT INTO Team VALUES(13,'Arsenal','Premier',569,68,278,91,11000000.0,43);
INSERT INTO Team VALUES(14,'FC Porto','Primeira Liga',378,37,307,76,3000000.0,32);
INSERT INTO Team VALUES(15,'Olympique Lyonnais','Ligue 1',392,41,301,103,4000000.0,47);
INSERT INTO Team VALUES(16,'Test','Test',0,0,0,0,0.0,0);
CREATE TABLE Players(
    playersID INTEGER PRIMARY KEY AUTOINCREMENT,
    playersName VARCHAR(255) NOT NULL ,
    playersNationality VARCHAR(255) NOT NULL ,
    playersGoalNo INT NULL,
    playersCupNo INT NULL,
    AssistNo INT NULL,
    playersGameNo INT NULL,
    DurationOfInjury REAL NULL,
    playersInjuryNo INT NULL,
    playersCardNo INT NULL,
    StartTheContract TEXT NOT NULL,
    EndTheContract TEXT NOT NULL,
    TeamID INTEGER NOT NULL,
    UNIQUE(playersName, playersNationality, TeamID),
    CONSTRAINT FK_Team_tID_tName_LeagueName FOREIGN KEY(TeamID)
    REFERENCES Team(teamID)
);
INSERT INTO Players VALUES(1,'Lionel Messi','Argentina',750,40,221,850,10.0,2,10,'2003/01/01','2022/01/01',1);
INSERT INTO Players VALUES(2,'Mohamed Salah','Egypt',100,10,50,300,0.0,0,10,'2010/01/01','2022/01/01',2);
INSERT INTO Players VALUES(3,'David Neres','Brazil',50,5,50,200,0.0,0,15,'2016/01/01','2021/01/01',3);
INSERT INTO Players VALUES(4,'Gianluigi Buffon','Italy',0,31,0,1000,0.0,1,2,'2001/07/09','2022/03/07',5);
INSERT INTO Players VALUES(5,'Paul Pogba','France',70,11,81,363,2.0,1,21,'2016/07/09','2023/03/06',6);
INSERT INTO Players VALUES(6,'Kevin De Bruyne','Belgium',95,30,130,407,0.0,0,11,'2015/12/11','2023/01/03',8);
INSERT INTO Players VALUES(7,'Neymar','Brazil',311,35,112,410,10.0,1,9,'2017/03/05','2023/04/04',7);
INSERT INTO Players VALUES(8,'Mateo Kovačić','Austria',20,12,41,250,3.0,1,13,'2018/01/03','2024/01/09',9);
INSERT INTO Players VALUES(9,'Manuel Neuer','West Germany',0,40,0,500,12.999999999999999999,2,3,'2011/03/07','2025/07/08',10);
INSERT INTO Players VALUES(10,'Eden Hazard','Belgium',160,21,110,550,15.0,2,20,'2019/06/06','2024/10/10',4);
INSERT INTO Players VALUES(11,'Frenkie de Jong','Netherlands',18,8,40,150,0.0,0,12,'2019/10/10','2024/05/05',1);
INSERT INTO Players VALUES(12,'Marco Reus','West Germany',153,11,210,360,20.0,4,12,'2012/10/13','2024/11/10',11);
INSERT INTO Players VALUES(13,'Jan Oblak','Slovenia',0,11,0,350,0.0,0,3,'2014/03/30','2025/01/30',12);
INSERT INTO Players VALUES(14,'Alexandre Lacazette','France',200,9,310,468,1.0,1,14,'2017/05/21','2026/04/12',13);
INSERT INTO Players VALUES(15,'Mehdi Taremi','Iran',101,8,43,206,0.0,0,18,'2020/04/28','2026/01/14',14);
INSERT INTO Players VALUES(16,'Memphis Depay','Netherlands',132,9,40,304,0.0,0,14,'2017/09/21','2022/03/25',15);
INSERT INTO Players VALUES(17,'Cristiano Ronaldo','Portugal',780,36,190,1180,8.0,1,17,'2018/08/17','2022/07/14',5);
INSERT INTO Players VALUES(18,'Marc-André ter Stegen','Germany',0,13,0,308,3.0,1,2,'2014/07/15','2025/12/12',1);
INSERT INTO Players VALUES(19,'Mr Test','Test',0,0,0,0,0.0,0,0,'0/0/0','0/0/0',16);
CREATE TABLE Position(
    posID INTEGER PRIMARY KEY AUTOINCREMENT,
    posName VARCHAR(255) NOT NULL,
    UNIQUE(posName)
);
INSERT INTO Position VALUES(1,'GK');
INSERT INTO Position VALUES(2,'CB');
INSERT INTO Position VALUES(3,'RB');
INSERT INTO Position VALUES(4,'LB');
INSERT INTO Position VALUES(5,'DMF');
INSERT INTO Position VALUES(6,'CMF');
INSERT INTO Position VALUES(7,'AMF');
INSERT INTO Position VALUES(8,'LMF');
INSERT INTO Position VALUES(9,'RMF');
INSERT INTO Position VALUES(10,'SS');
INSERT INTO Position VALUES(11,'CF');
INSERT INTO Position VALUES(12,'RWF');
INSERT INTO Position VALUES(13,'LWF');
CREATE TABLE PlayersPosition(
    ppID INTEGER PRIMARY KEY AUTOINCREMENT,
    playersID INTEGER NOT NULL,
    PositionID INTEGER NOT NULL,
    CONSTRAINT FK_pID_playersID FOREIGN KEY(playersID)
    REFERENCES Players(playersID),
    CONSTRAINT FK_posID FOREIGN KEY(PositionID)
    REFERENCES Position(posID)
);
INSERT INTO PlayersPosition VALUES(1,1,10);
INSERT INTO PlayersPosition VALUES(2,1,11);
INSERT INTO PlayersPosition VALUES(3,1,13);
INSERT INTO PlayersPosition VALUES(4,1,12);
INSERT INTO PlayersPosition VALUES(5,2,10);
INSERT INTO PlayersPosition VALUES(6,3,12);
INSERT INTO PlayersPosition VALUES(7,7,8);
INSERT INTO PlayersPosition VALUES(8,9,1);
INSERT INTO PlayersPosition VALUES(9,4,1);
INSERT INTO PlayersPosition VALUES(10,5,6);
INSERT INTO PlayersPosition VALUES(11,11,6);
INSERT INTO PlayersPosition VALUES(12,6,6);
INSERT INTO PlayersPosition VALUES(13,8,6);
INSERT INTO PlayersPosition VALUES(14,10,8);
INSERT INTO PlayersPosition VALUES(15,12,7);
INSERT INTO PlayersPosition VALUES(16,13,1);
INSERT INTO PlayersPosition VALUES(17,14,11);
INSERT INTO PlayersPosition VALUES(18,15,11);
INSERT INTO PlayersPosition VALUES(19,16,11);
INSERT INTO PlayersPosition VALUES(20,17,11);
INSERT INTO PlayersPosition VALUES(21,18,1);
INSERT INTO PlayersPosition VALUES(22,17,10);
INSERT INTO PlayersPosition VALUES(23,19,1);
CREATE TABLE Coach(
    coachID INTEGER PRIMARY KEY AUTOINCREMENT,
    coachName VARCHAR(255) NOT NULL,
    coachNationality VARCHAR(255) NOT NULL,
    coachGameNo INTEGER NULL,
    coachCupNo INTEGER NULL,
    UNIQUE(coachName, coachNationality)
);
INSERT INTO Coach VALUES(1,'Ronald Koeman','Netherlands',20,0);
INSERT INTO Coach VALUES(2,'Jürgen Klopp','West Germany',200,5);
INSERT INTO Coach VALUES(3,'Erik ten Hag','Netherlands',100,2);
INSERT INTO Coach VALUES(4,'Zinedine Zidane','France',500,20);
INSERT INTO Coach VALUES(5,'Andrea Pirlo','Italy',30,0);
INSERT INTO Coach VALUES(6,'Ole Gunnar Solskjær','Norway',500,10);
INSERT INTO Coach VALUES(7,'Vacant','France',30,0);
INSERT INTO Coach VALUES(8,'Pep Guardiola','Spain',510,10);
INSERT INTO Coach VALUES(9,'Frank Lampard','England',50,0);
INSERT INTO Coach VALUES(10,'Hans-Dieter Flick','West Germany',90,3);
INSERT INTO Coach VALUES(11,'Edin Terzić','West Germany',100,3);
INSERT INTO Coach VALUES(12,'Diego Simeone','Argentina',340,13);
INSERT INTO Coach VALUES(13,'Mikel Arteta','Spain',87,0);
INSERT INTO Coach VALUES(14,'Sérgio Conceição','Portugal',300,5);
INSERT INTO Coach VALUES(15,'Rudi Garcia','France',110,0);
CREATE TABLE CoachLeadTeam(
    leadID INTEGER PRIMARY KEY AUTOINCREMENT,
    coachID INTEGER NOT NULL,
    teamID INTEGER NOT NULL,
    StartTheContract TEXT NOT NULL,
    EndTheContract TEXT NOT NULL,
    UNIQUE(coachID, teamID),
    CONSTRAINT CK_coach_name_nationality FOREIGN KEY(coachID)
    REFERENCES Coach(coachID),
    CONSTRAINT SK_team_ID FOREIGN KEY(teamID)
    REFERENCES Team(teamID)
);
INSERT INTO CoachLeadTeam VALUES(1,1,1,'2020/01/01','2022/01/01');
INSERT INTO CoachLeadTeam VALUES(2,2,2,'2015/01/01','2023/01/01');
INSERT INTO CoachLeadTeam VALUES(3,3,3,'2017/02/02','2023/01/01');
INSERT INTO CoachLeadTeam VALUES(4,4,4,'2016/07/09','2024/06/09');
INSERT INTO CoachLeadTeam VALUES(5,5,5,'2020/03/05','2023/05/05');
INSERT INTO CoachLeadTeam VALUES(6,6,6,'2018/03/04','2022/01/07');
INSERT INTO CoachLeadTeam VALUES(7,7,7,'2019/05/05','2023/10/10');
INSERT INTO CoachLeadTeam VALUES(8,8,8,'2016/11/30','2023/05/30');
INSERT INTO CoachLeadTeam VALUES(9,9,9,'2019/12/30','2022/10/16');
INSERT INTO CoachLeadTeam VALUES(10,10,10,'2019/03/20','2023/11/17');
INSERT INTO CoachLeadTeam VALUES(11,11,11,'2020/10/14','2025/04/14');
INSERT INTO CoachLeadTeam VALUES(12,12,12,'2014/05/23','2024/04/04');
INSERT INTO CoachLeadTeam VALUES(13,13,13,'2019/04/05','2024/12/05');
INSERT INTO CoachLeadTeam VALUES(14,14,14,'2017/11/01','2024/05/14');
INSERT INTO CoachLeadTeam VALUES(15,15,15,'2019/04/07','2023/04/17');
CREATE TABLE TheManager(
    managerID INTEGER PRIMARY KEY AUTOINCREMENT,
    managerName VARCHAR(255) NOT NULL,
    managerNationality VARCHAR(255) NOT NULL,
    managerCupNo INTEGER NULL,
    managerGameNo INTEGER NULL,
    UNIQUE(managerName, managerNationality)
);
INSERT INTO TheManager VALUES(1,'Mr A','Spain',10,500);
INSERT INTO TheManager VALUES(2,'Mr B','Argentina',3,500);
INSERT INTO TheManager VALUES(3,'Mr C','Spain',1,300);
INSERT INTO TheManager VALUES(4,'Florentino Pérez','Spain',41,500);
INSERT INTO TheManager VALUES(5,'Mr D','Italy',21,458);
INSERT INTO TheManager VALUES(6,'Mr E','Norway',20,500);
INSERT INTO TheManager VALUES(7,'Tamim bin Hamad Al Thani','Qatar',17,460);
INSERT INTO TheManager VALUES(8,'Khaldoon Al Mubarak','United Arab Emirates',15,400);
INSERT INTO TheManager VALUES(9,'Mr John','England',10,305);
INSERT INTO TheManager VALUES(10,'Karl-Heinz Rummenigge','West Germany',22,590);
INSERT INTO TheManager VALUES(11,'Reinhard Rauball','Germany',10,410);
INSERT INTO TheManager VALUES(12,'Enrique Cerezo','Spain',21,470);
INSERT INTO TheManager VALUES(13,'Mr Ab','England',23,478);
INSERT INTO TheManager VALUES(14,'Jorge Nuno Pinto da Costa','Portugal',13,400);
INSERT INTO TheManager VALUES(15,'Jean-Michel Aulas','France',15,489);
CREATE TABLE Manager_Manage_Team(
    manageID INTEGER PRIMARY KEY AUTOINCREMENT,
    managerID INTEGER NOT NULL,
    teamID INTEGER NOT NULL,
    StartTheContract TEXT NOT NULL,
    EndTheContract TEXT NOT NULL,
    UNIQUE(managerID, teamID),
    CONSTRAINT CK_TheManager_name_nationality FOREIGN KEY(managerID)
    REFERENCES TheManager(managerID),
    CONSTRAINT SK_Team_ID FOREIGN KEY(teamID)
    REFERENCES Team(teamID)
);
INSERT INTO Manager_Manage_Team VALUES(1,1,1,'2019/01/01','2022/01/01');
INSERT INTO Manager_Manage_Team VALUES(2,2,2,'2017/01/01','2022/01/01');
INSERT INTO Manager_Manage_Team VALUES(3,3,3,'2018/01/01','2023/01/01');
INSERT INTO Manager_Manage_Team VALUES(4,4,4,'2015/05/10','2023/10/17');
INSERT INTO Manager_Manage_Team VALUES(5,5,5,'2016/07/30','2023/12/17');
INSERT INTO Manager_Manage_Team VALUES(6,6,6,'2015/12/06','2023/01/10');
INSERT INTO Manager_Manage_Team VALUES(7,7,7,'2016/01/07','2025/03/29');
INSERT INTO Manager_Manage_Team VALUES(8,8,8,'2017/01/01','2026/07/14');
INSERT INTO Manager_Manage_Team VALUES(9,9,9,'2019/02/08','2023/12/17');
INSERT INTO Manager_Manage_Team VALUES(10,10,10,'2019/01/08','2024/05/05');
INSERT INTO Manager_Manage_Team VALUES(11,11,11,'2018/04/19','2023/04/06');
INSERT INTO Manager_Manage_Team VALUES(12,12,12,'2016/09/16','2022/04/14');
INSERT INTO Manager_Manage_Team VALUES(13,13,13,'2018/05/25','2022/04/07');
INSERT INTO Manager_Manage_Team VALUES(14,14,14,'2019/08/30','2023/07/17');
INSERT INTO Manager_Manage_Team VALUES(15,15,15,'2018/04/16','2024/05/15');
CREATE TABLE Sponser(
    sponserID INTEGER PRIMARY KEY AUTOINCREMENT,
    sponserName VARCHAR(255) NOT NULL,
    UNIQUE(sponserName)
);
INSERT INTO Sponser VALUES(1,'Rakuten');
INSERT INTO Sponser VALUES(2,'Standard Chartered');
INSERT INTO Sponser VALUES(3,'Ziggo');
INSERT INTO Sponser VALUES(4,'Fly Emirates');
INSERT INTO Sponser VALUES(5,'Jeep');
INSERT INTO Sponser VALUES(6,'Chevrolet');
INSERT INTO Sponser VALUES(7,'Etihad Airways');
INSERT INTO Sponser VALUES(8,'Yokohama');
INSERT INTO Sponser VALUES(9,'T-Mobile');
INSERT INTO Sponser VALUES(10,'1&1');
INSERT INTO Sponser VALUES(11,'Plus500');
INSERT INTO Sponser VALUES(12,'Meo');
CREATE TABLE TeamDealSponser(
    dealID INTEGER PRIMARY KEY AUTOINCREMENT,
    teamID INTEGER NULL,
    sponserID INTEGER NULL,
    DealTime TEXT NULL,
    DealAmount REAL NULL,
    CONSTRAINT SK_Team_name_leaguename FOREIGN KEY(teamID)
    REFERENCES Team(teamID),
    CONSTRAINT SK_Sponser_ID_name FOREIGN KEY(sponserID)
    REFERENCES Sponser(sponserID)
);
INSERT INTO TeamDealSponser VALUES(1,1,1,'5 Years',20000000.0);
INSERT INTO TeamDealSponser VALUES(2,2,2,'10 Years',10000000.0);
INSERT INTO TeamDealSponser VALUES(3,3,3,'15 Years',9000000.0);
INSERT INTO TeamDealSponser VALUES(4,4,4,'10 Years',40000000.0);
INSERT INTO TeamDealSponser VALUES(5,5,5,'20 Years',60000000.0);
INSERT INTO TeamDealSponser VALUES(6,6,6,'5 Years',9000000.0);
INSERT INTO TeamDealSponser VALUES(7,7,7,'10 Years',80000000.0);
INSERT INTO TeamDealSponser VALUES(8,9,8,'20 Years',80000000.0);
INSERT INTO TeamDealSponser VALUES(9,10,9,'20 Years',90000000.0);
INSERT INTO TeamDealSponser VALUES(10,8,4,'10 Years',20000000.0);
INSERT INTO TeamDealSponser VALUES(11,11,10,'10 Years',90000000.0);
INSERT INTO TeamDealSponser VALUES(12,12,11,'10 Years',80000000.0);
INSERT INTO TeamDealSponser VALUES(13,13,4,'5 Years',80000000.0);
INSERT INTO TeamDealSponser VALUES(14,14,12,'15 Years',90000000.0);
INSERT INTO TeamDealSponser VALUES(15,15,4,'5 Years',40000000.0);
CREATE TABLE User(
    userID INTEGER PRIMARY KEY AUTOINCREMENT,
    userName VARCHAR(255) NOT NULL,
    password TEXT NOT NULL,
    userEmail VARCHAR(255) NOT NULL,
    UNIQUE(userName,userEmail)
);
INSERT INTO User VALUES(1,'Hojjat','123456','Hojjat@gmail.com');
INSERT INTO User VALUES(2,'Ali','5033','Ali@gmail.com');
INSERT INTO User VALUES(3,'Hamed','50333374','Hamed@gmail.com');
INSERT INTO User VALUES(4,'Hasan','753951','Hasan@test.com');
INSERT INTO User VALUES(5,'Ahmad','012365','Ahmad@test.com');
CREATE TABLE UserFavoriteTeam(
    favoriteTeamID INTEGER PRIMARY KEY AUTOINCREMENT,
    userID INTEGER NULL,
    teamID INTEGER NULL,
    CONSTRAINT CK_Team_ID FOREIGN KEY(teamID)
    REFERENCES Team(teamID),
    CONSTRAINT CK_User_ID FOREIGN KEY(userID)
    REFERENCES User(userID)
);
INSERT INTO UserFavoriteTeam VALUES(1,1,1);
INSERT INTO UserFavoriteTeam VALUES(2,1,3);
INSERT INTO UserFavoriteTeam VALUES(3,2,2);
INSERT INTO UserFavoriteTeam VALUES(4,3,4);
INSERT INTO UserFavoriteTeam VALUES(5,3,5);
INSERT INTO UserFavoriteTeam VALUES(6,4,7);
INSERT INTO UserFavoriteTeam VALUES(7,2,9);
INSERT INTO UserFavoriteTeam VALUES(8,1,2);
INSERT INTO UserFavoriteTeam VALUES(9,4,10);
INSERT INTO UserFavoriteTeam VALUES(10,4,8);
INSERT INTO UserFavoriteTeam VALUES(11,1,11);
INSERT INTO UserFavoriteTeam VALUES(12,5,12);
INSERT INTO UserFavoriteTeam VALUES(13,5,13);
INSERT INTO UserFavoriteTeam VALUES(14,4,15);
INSERT INTO UserFavoriteTeam VALUES(15,2,14);
CREATE TABLE Transfer(
    transferID INTEGER PRIMARY KEY AUTOINCREMENT,
    SellerTeam VARCHAR(255) NOT NULL,
    PurchaserTeam VARCHAR(255) NOT NULL
);
INSERT INTO Transfer VALUES(1,'Ajax','Barcelona');
INSERT INTO Transfer VALUES(2,'Barcelona','Paris Saint-Germain');
INSERT INTO Transfer VALUES(3,'Ajax','Chelsea');
INSERT INTO Transfer VALUES(4,'Paris Saint-Germain','Juventus');
INSERT INTO Transfer VALUES(5,'Real Madrid','Juventus');
INSERT INTO Transfer VALUES(6,'Olympique Lyonnais','Barcelona');
INSERT INTO Transfer VALUES(7,'FC Porto','Real Madrid');
INSERT INTO Transfer VALUES(8,'Manchester City','FC Bayern Munich');
INSERT INTO Transfer VALUES(9,'Borussia Dortmund','FC Bayern Munich');
INSERT INTO Transfer VALUES(10,'Barcelona','FC Bayern Munich');
CREATE TABLE Contract(
    contractID INTEGER PRIMARY KEY AUTOINCREMENT,
    teamID INTEGER NULL,
    transferID INTEGER NULL,
    CONSTRAINT CK_TeamID FOREIGN KEY(teamID)
    REFERENCES Team(teamID),
    CONSTRAINT CK_TransferID FOREIGN KEY(transferID)
    REFERENCES Transfer(transferID)
);
INSERT INTO Contract VALUES(1,1,1);
INSERT INTO Contract VALUES(2,3,1);
INSERT INTO Contract VALUES(3,1,2);
INSERT INTO Contract VALUES(4,4,5);
INSERT INTO Contract VALUES(5,5,5);
INSERT INTO Contract VALUES(6,3,3);
INSERT INTO Contract VALUES(7,9,3);
INSERT INTO Contract VALUES(8,7,4);
INSERT INTO Contract VALUES(9,9,4);
INSERT INTO Contract VALUES(10,15,6);
INSERT INTO Contract VALUES(11,1,6);
INSERT INTO Contract VALUES(12,4,7);
INSERT INTO Contract VALUES(13,14,7);
INSERT INTO Contract VALUES(14,10,8);
INSERT INTO Contract VALUES(15,8,8);
INSERT INTO Contract VALUES(16,10,9);
INSERT INTO Contract VALUES(17,11,9);
INSERT INTO Contract VALUES(18,1,10);
INSERT INTO Contract VALUES(19,10,10);
CREATE TABLE UserFavoritePlayers(
    favoritePlayersID INTEGER PRIMARY KEY AUTOINCREMENT,
    userID INTEGER NULL,
    playersID INTEGER NULL,
    grade REAL NULL,
    CONSTRAINT CK_UserID FOREIGN KEY(userID)
    REFERENCES User(userID),
    CONSTRAINT CK_PlayersID FOREIGN KEY(playersID)
    REFERENCES Players(playersID)
);
INSERT INTO UserFavoritePlayers VALUES(1,1,1,10.0);
INSERT INTO UserFavoritePlayers VALUES(2,1,11,9.0);
INSERT INTO UserFavoritePlayers VALUES(3,1,7,10.0);
INSERT INTO UserFavoritePlayers VALUES(4,2,6,9.5);
INSERT INTO UserFavoritePlayers VALUES(5,3,10,9.0);
INSERT INTO UserFavoritePlayers VALUES(6,4,8,8.0);
INSERT INTO UserFavoritePlayers VALUES(7,1,8,7.0);
INSERT INTO UserFavoritePlayers VALUES(8,4,9,10.0);
INSERT INTO UserFavoritePlayers VALUES(9,3,5,8.5);
INSERT INTO UserFavoritePlayers VALUES(10,2,4,10.0);
INSERT INTO UserFavoritePlayers VALUES(11,1,12,8.6999999999999992894);
INSERT INTO UserFavoritePlayers VALUES(12,5,17,10.0);
INSERT INTO UserFavoritePlayers VALUES(13,4,18,8.6999999999999992894);
INSERT INTO UserFavoritePlayers VALUES(14,2,16,8.0);
INSERT INTO UserFavoritePlayers VALUES(15,5,14,7.7999999999999998223);
INSERT INTO UserFavoritePlayers VALUES(16,3,13,9.0);
CREATE TABLE Match_(
    matchID INTEGER PRIMARY KEY AUTOINCREMENT,
    StaditumName VARCHAR(255) NOT NULL,
    Year INTEGER NOT NULL,
    Month INTEGER NOT NULL,
    Day TEXT NOT NULL,
    HomeTeam VARCHAR(255) NOT NULL,
    AwayTeam VARCHAR(255) NOT NULL,
    homegame_or_not TEXT NULL,
    matchGoalNo INTEGER NULL,
    matchCardNo INTEGER NULL,
    UNIQUE(StaditumName, Year, Month, Day, HomeTeam, AwayTeam)
);
INSERT INTO Match_ VALUES(1,'Camp Nou',2020,1,'10','Barcelona','Liverpool','Yes',2,5);
INSERT INTO Match_ VALUES(2,'Camp Nou',2019,3,'21','Barcelona','Real Madrid','Yes',0,2);
INSERT INTO Match_ VALUES(3,'Johan Cruyff Arena',2016,10,'30','Ajax','FC Bayern Munich','Yes',3,6);
INSERT INTO Match_ VALUES(4,'Etihad Stadium',2019,5,'17','Manchester City','Juventus','Yes',5,9);
INSERT INTO Match_ VALUES(5,'Parc des Princes',2018,9,'28','Paris Saint-Germain','Chelsea','Yes',2,2);
INSERT INTO Match_ VALUES(6,'Metropolitano Stadium',2019,7,'8','Atlético Madrid','Barcelona','No',3,8);
INSERT INTO Match_ VALUES(7,'Metropolitano Stadium',2019,10,'21','Atlético Madrid','Real Madrid','No',4,10);
INSERT INTO Match_ VALUES(8,'Emirates Stadium',2017,3,'27','Arsenal','Olympique Lyonnais','No',5,6);
INSERT INTO Match_ VALUES(9,'Estádio do Dragão',2019,5,'24','FC Porto','Ajax','No',3,4);
INSERT INTO Match_ VALUES(10,'Santiago Bernabéu',2018,10,'19','Real Madrid','Juventus','No',4,9);
CREATE TABLE UserWatchMatch(
    WatchID INTEGER PRIMARY KEY AUTOINCREMENT,
    matchID INTEGER NULL,
    userID INTEGER NULL,
    CONSTRAINT FK_matchID FOREIGN KEY(matchID)
    REFERENCES  Match_(matchID),
    CONSTRAINT FK_userID FOREIGN KEY(userID)
    REFERENCES User(userID)
);
INSERT INTO UserWatchMatch VALUES(1,1,1);
INSERT INTO UserWatchMatch VALUES(2,2,1);
INSERT INTO UserWatchMatch VALUES(3,5,2);
INSERT INTO UserWatchMatch VALUES(4,3,3);
INSERT INTO UserWatchMatch VALUES(5,5,4);
INSERT INTO UserWatchMatch VALUES(6,6,5);
INSERT INTO UserWatchMatch VALUES(7,7,2);
INSERT INTO UserWatchMatch VALUES(8,8,3);
INSERT INTO UserWatchMatch VALUES(9,9,4);
INSERT INTO UserWatchMatch VALUES(10,10,5);
CREATE TABLE TeamMatch(
    TeamMatchID INTEGER PRIMARY KEY AUTOINCREMENT,
    matchID INTEGER NOT NULL,
    teamID INTEGER NOT NULL,
    CONSTRAINT CK_TeamID FOREIGN KEY(teamID)
    REFERENCES Team(teamID),
    CONSTRAINT CK_MatchID FOREIGN KEY(matchID)
    REFERENCES Match_(matchID)
);
INSERT INTO TeamMatch VALUES(1,1,1);
INSERT INTO TeamMatch VALUES(3,2,1);
INSERT INTO TeamMatch VALUES(4,3,3);
INSERT INTO TeamMatch VALUES(5,4,8);
INSERT INTO TeamMatch VALUES(6,5,7);
INSERT INTO TeamMatch VALUES(7,6,1);
INSERT INTO TeamMatch VALUES(8,7,4);
INSERT INTO TeamMatch VALUES(9,8,15);
INSERT INTO TeamMatch VALUES(10,9,3);
INSERT INTO TeamMatch VALUES(11,10,5);
CREATE TABLE Stadium(
    stadiumID INTEGER PRIMARY KEY AUTOINCREMENT,
    StaditumName VARCHAR(255) NOT NULL,
    stadiumCityName VARCHAR(255) NOT NULL,
    capacity INTEGER NULL,
    ConstructionAmount REAL NULL,
    ConstructionTime REAL NULL,
    TimeToStartConstruction REAL NULL,
    EndTimeConstructions REAL NULL,
    UNIQUE(StaditumName,stadiumCityName)
);
INSERT INTO Stadium VALUES(1,'Camp Nou','Barcelona',99345,30000000.0,2.0,2009.9999999999999999,2011.0);
INSERT INTO Stadium VALUES(2,'Anfield','Liverpool',53394,20000000.0,1.0,1884.0,1885.0);
INSERT INTO Stadium VALUES(3,'Johan Cruyff Arena','Amsterdam',55500,2000000.0,3.0,1992.9999999999999999,1996.0);
INSERT INTO Stadium VALUES(4,'Santiago Bernabéu','Madrid',81044,50000000.0,3.0,1944.0,1946.9999999999999999);
INSERT INTO Stadium VALUES(5,'Allianz','Turin',41507,10000000.0,2.0,2008.9999999999999999,2011.0);
INSERT INTO Stadium VALUES(6,'Old Trafford','Greater Manchester',74140,30000000.0,1.0,1908.9999999999999999,1909.9999999999999999);
INSERT INTO Stadium VALUES(7,'Parc des Princes','Paris',47929,40000000.0,5.0,1967.0,1971.9999999999999999);
INSERT INTO Stadium VALUES(8,'Etihad Stadium','Manchester',53000,40000000.0,3.0,1998.9999999999999999,2002.0);
INSERT INTO Stadium VALUES(9,'Stamford Bridge','London',40834,10000000.0,1.0,1876.0,1877.0);
INSERT INTO Stadium VALUES(10,'Allianz Arena','Munich',70000,30000000.0,3.0,2002.0,2005.0000000000000001);
INSERT INTO Stadium VALUES(11,'Westfalenstadion','Dortmund',83000,30000000.0,3.0,1971.0,1973.9999999999999999);
INSERT INTO Stadium VALUES(12,'Metropolitano Stadium','Madrid',68456,9000000.0,3.0,1989.9999999999999999,1992.9999999999999999);
INSERT INTO Stadium VALUES(13,'Emirates Stadium','London',60704,40000000.0,2.0,2004.0,2005.9999999999999999);
INSERT INTO Stadium VALUES(14,'Estádio do Dragão','Proto',50033,2000000.0,1.0,2003.0,2004.0);
INSERT INTO Stadium VALUES(15,'Parc Olympique Lyonnais','Lyon',59186,9000000.0,4.0,2012.0,2015.9999999999999998);
CREATE TABLE StadiumTeam(
    stID INTEGER PRIMARY KEY AUTOINCREMENT,
    teamID INTEGER NOT NULL,
    stadiumID NOT NULL,
    CONSTRAINT FK_TeamID FOREIGN KEY(teamID)
    REFERENCES Team(teamID),
    CONSTRAINT FK_stadiumID FOREIGN KEY(stadiumID)
    REFERENCES Stadium(stadiumID)
);
INSERT INTO StadiumTeam VALUES(1,1,1);
INSERT INTO StadiumTeam VALUES(2,2,2);
INSERT INTO StadiumTeam VALUES(3,3,3);
INSERT INTO StadiumTeam VALUES(4,4,4);
INSERT INTO StadiumTeam VALUES(5,5,5);
INSERT INTO StadiumTeam VALUES(6,6,6);
INSERT INTO StadiumTeam VALUES(7,7,7);
INSERT INTO StadiumTeam VALUES(8,8,8);
INSERT INTO StadiumTeam VALUES(9,9,9);
INSERT INTO StadiumTeam VALUES(10,10,10);
INSERT INTO StadiumTeam VALUES(11,11,11);
INSERT INTO StadiumTeam VALUES(12,12,12);
INSERT INTO StadiumTeam VALUES(13,13,13);
INSERT INTO StadiumTeam VALUES(14,14,14);
INSERT INTO StadiumTeam VALUES(15,15,15);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('Team',16);
INSERT INTO sqlite_sequence VALUES('Players',19);
INSERT INTO sqlite_sequence VALUES('Position',13);
INSERT INTO sqlite_sequence VALUES('PlayersPosition',23);
INSERT INTO sqlite_sequence VALUES('Coach',15);
INSERT INTO sqlite_sequence VALUES('CoachLeadTeam',15);
INSERT INTO sqlite_sequence VALUES('TheManager',15);
INSERT INTO sqlite_sequence VALUES('Manager_Manage_Team',15);
INSERT INTO sqlite_sequence VALUES('Sponser',12);
INSERT INTO sqlite_sequence VALUES('TeamDealSponser',15);
INSERT INTO sqlite_sequence VALUES('User',5);
INSERT INTO sqlite_sequence VALUES('UserFavoriteTeam',15);
INSERT INTO sqlite_sequence VALUES('Transfer',10);
INSERT INTO sqlite_sequence VALUES('Contract',19);
INSERT INTO sqlite_sequence VALUES('UserFavoritePlayers',16);
INSERT INTO sqlite_sequence VALUES('Match_',10);
INSERT INTO sqlite_sequence VALUES('UserWatchMatch',10);
INSERT INTO sqlite_sequence VALUES('TeamMatch',11);
INSERT INTO sqlite_sequence VALUES('Stadium',15);
INSERT INTO sqlite_sequence VALUES('StadiumTeam',15);
COMMIT;
