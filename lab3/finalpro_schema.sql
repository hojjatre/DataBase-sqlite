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
INSERT INTO Players VALUES(1,'Lionel Messi','Argentina',750,40,221,1029,10.0,2,10,'2003/01/01','2022/01/01',1);
INSERT INTO Players VALUES(2,'Mohamed Salah','Egypt',100,10,50,300,0.0,0,10,'2010/01/01','2022/01/01',2);
INSERT INTO Players VALUES(3,'David Neres','Brazil',50,5,50,200,0.0,0,15,'2016/01/01','2021/01/01',3);
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
CREATE TABLE Sponser(
    sponserID INTEGER PRIMARY KEY AUTOINCREMENT,
    sponserName VARCHAR(255) NOT NULL,
    UNIQUE(sponserName)
);
INSERT INTO Sponser VALUES(1,'Rakuten');
INSERT INTO Sponser VALUES(2,'Standard Chartered');
INSERT INTO Sponser VALUES(3,'Ziggo');
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
CREATE TABLE User(
    userID INTEGER PRIMARY KEY AUTOINCREMENT,
    userName VARCHAR(255) NOT NULL,
    password TEXT NOT NULL,
    userEmail VARCHAR(255) NOT NULL,
    UNIQUE(userName,userEmail)
);
INSERT INTO User VALUES(1,'Hojjat','123456','Hojjat@gmail.com');
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
CREATE TABLE Transfer(
    transferID INTEGER PRIMARY KEY AUTOINCREMENT,
    SellerTeam VARCHAR(255) NOT NULL,
    PurchaserTeam VARCHAR(255) NOT NULL
);
INSERT INTO Transfer VALUES(1,'Ajax','Barcelona');
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
INSERT INTO TeamMatch VALUES(2,1,2);
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
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('Team',3);
INSERT INTO sqlite_sequence VALUES('Players',3);
INSERT INTO sqlite_sequence VALUES('Position',13);
INSERT INTO sqlite_sequence VALUES('PlayersPosition',6);
INSERT INTO sqlite_sequence VALUES('Coach',3);
INSERT INTO sqlite_sequence VALUES('CoachLeadTeam',3);
INSERT INTO sqlite_sequence VALUES('TheManager',3);
INSERT INTO sqlite_sequence VALUES('Manager_Manage_Team',3);
INSERT INTO sqlite_sequence VALUES('Sponser',3);
INSERT INTO sqlite_sequence VALUES('TeamDealSponser',3);
INSERT INTO sqlite_sequence VALUES('User',1);
INSERT INTO sqlite_sequence VALUES('UserFavoriteTeam',1);
INSERT INTO sqlite_sequence VALUES('Transfer',1);
INSERT INTO sqlite_sequence VALUES('Contract',2);
INSERT INTO sqlite_sequence VALUES('UserFavoritePlayers',1);
INSERT INTO sqlite_sequence VALUES('Match_',1);
INSERT INTO sqlite_sequence VALUES('UserWatchMatch',1);
INSERT INTO sqlite_sequence VALUES('TeamMatch',2);
INSERT INTO sqlite_sequence VALUES('Stadium',1);
INSERT INTO sqlite_sequence VALUES('StadiumTeam',1);
COMMIT;
