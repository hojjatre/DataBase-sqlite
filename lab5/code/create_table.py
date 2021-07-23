import sqlite3

def create_table(conn, create_table_sql):
    c = conn.cursor()
    c.execute(create_table_sql)

def main():
    conn = sqlite3.connect("db_pro.db")
    team = """CREATE TABLE Team(
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
            );"""

    players = """CREATE TABLE Players(
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
                );"""
    position = """CREATE TABLE Position(
                    posID INTEGER PRIMARY KEY AUTOINCREMENT,
                    posName VARCHAR(255) NOT NULL,
                    UNIQUE(posName)
                );"""

    playersposition = """CREATE TABLE PlayersPosition(
                            ppID INTEGER PRIMARY KEY AUTOINCREMENT,
                            playersID INTEGER NOT NULL,
                            PositionID INTEGER NOT NULL,
                            CONSTRAINT FK_pID_playersID FOREIGN KEY(playersID)
                            REFERENCES Players(playersID),
                            CONSTRAINT FK_posID FOREIGN KEY(PositionID)
                            REFERENCES Position(posID)
                    );"""

    coach = """CREATE TABLE Coach(
                coachID INTEGER PRIMARY KEY AUTOINCREMENT,
                coachName VARCHAR(255) NOT NULL,
                coachNationality VARCHAR(255) NOT NULL,
                coachGameNo INTEGER NULL,
                coachCupNo INTEGER NULL,
                UNIQUE(coachName, coachNationality)
            );"""

    coach_lead_team = """CREATE TABLE CoachLeadTeam(
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
                );"""

    the_manager = """CREATE TABLE TheManager(
                managerID INTEGER PRIMARY KEY AUTOINCREMENT,
                managerName VARCHAR(255) NOT NULL,
                managerNationality VARCHAR(255) NOT NULL,
                managerCupNo INTEGER NULL,
                managerGameNo INTEGER NULL,
                UNIQUE(managerName, managerNationality)
            );"""

    manager_manage_team = """CREATE TABLE Manager_Manage_Team(
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
                    );"""

    sponser = """CREATE TABLE Sponser(
                sponserID INTEGER PRIMARY KEY AUTOINCREMENT,
                sponserName VARCHAR(255) NOT NULL,
                UNIQUE(sponserName)
            );"""

    team_deal_sponser = """CREATE TABLE TeamDealSponser(
                dealID INTEGER PRIMARY KEY AUTOINCREMENT,
                teamID INTEGER NULL,
                sponserID INTEGER NULL,
                DealTime TEXT NULL,
                DealAmount REAL NULL,
                CONSTRAINT SK_Team_name_leaguename FOREIGN KEY(teamID)
                REFERENCES Team(teamID),
                CONSTRAINT SK_Sponser_ID_name FOREIGN KEY(sponserID)
                REFERENCES Sponser(sponserID)
            );"""

    user = """CREATE TABLE User(
                userID INTEGER PRIMARY KEY AUTOINCREMENT,
                userName VARCHAR(255) NOT NULL,
                password TEXT NOT NULL,
                userEmail VARCHAR(255) NOT NULL,
                UNIQUE(userName,userEmail)
            );"""

    user_favorite_team = """CREATE TABLE UserFavoriteTeam(
                favoriteTeamID INTEGER PRIMARY KEY AUTOINCREMENT,
                userID INTEGER NULL,
                teamID INTEGER NULL,
                CONSTRAINT CK_Team_ID FOREIGN KEY(teamID)
                REFERENCES Team(teamID),
                CONSTRAINT CK_User_ID FOREIGN KEY(userID)
                REFERENCES User(userID)
            );"""

    transfer = """CREATE TABLE Transfer(
                transferID INTEGER PRIMARY KEY AUTOINCREMENT,
                SellerTeam VARCHAR(255) NOT NULL,
                PurchaserTeam VARCHAR(255) NOT NULL
            );"""

    contract = """CREATE TABLE Contract(
                contractID INTEGER PRIMARY KEY AUTOINCREMENT,
                teamID INTEGER NULL,
                transferID INTEGER NULL,
                CONSTRAINT CK_TeamID FOREIGN KEY(teamID)
                REFERENCES Team(teamID),
                CONSTRAINT CK_TransferID FOREIGN KEY(transferID)
                REFERENCES Transfer(transferID)
            );"""

    user_favorite_players = """CREATE TABLE UserFavoritePlayers(
                favoritePlayersID INTEGER PRIMARY KEY AUTOINCREMENT,
                userID INTEGER NULL,
                playersID INTEGER NULL,
                grade REAL NULL,
                CONSTRAINT CK_UserID FOREIGN KEY(userID)
                REFERENCES User(userID),
                CONSTRAINT CK_PlayersID FOREIGN KEY(playersID)
                REFERENCES Players(playersID)
            );"""

    match_ = """CREATE TABLE Match_(
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
            );"""

    user_watch_match = """CREATE TABLE UserWatchMatch(
                WatchID INTEGER PRIMARY KEY AUTOINCREMENT,
                matchID INTEGER NULL,
                userID INTEGER NULL,
                CONSTRAINT FK_matchID FOREIGN KEY(matchID)
                REFERENCES  Match_(matchID),
                CONSTRAINT FK_userID FOREIGN KEY(userID)
                REFERENCES User(userID)
            );"""

    team_match = """CREATE TABLE TeamMatch(
                TeamMatchID INTEGER PRIMARY KEY AUTOINCREMENT,
                matchID INTEGER NOT NULL,
                teamID INTEGER NOT NULL,
                CONSTRAINT CK_TeamID FOREIGN KEY(teamID)
                REFERENCES Team(teamID),
                CONSTRAINT CK_MatchID FOREIGN KEY(matchID)
                REFERENCES Match_(matchID)
            );"""

    stadium = """CREATE TABLE Stadium(
                stadiumID INTEGER PRIMARY KEY AUTOINCREMENT,
                StaditumName VARCHAR(255) NOT NULL,
                stadiumCityName VARCHAR(255) NOT NULL,
                capacity INTEGER NULL,
                ConstructionAmount REAL NULL,
                ConstructionTime REAL NULL,
                TimeToStartConstruction REAL NULL,
                EndTimeConstructions REAL NULL,
                UNIQUE(StaditumName,stadiumCityName)
            );"""

    stadium_team = """CREATE TABLE StadiumTeam(
                stID INTEGER PRIMARY KEY AUTOINCREMENT,
                teamID INTEGER NOT NULL,
                stadiumID NOT NULL,
                CONSTRAINT FK_TeamID FOREIGN KEY(teamID)
                REFERENCES Team(teamID),
                CONSTRAINT FK_stadiumID FOREIGN KEY(stadiumID)
                REFERENCES Stadium(stadiumID)
            );"""

    if conn is not None:
        create_table(conn, team)
        create_table(conn, players)
        create_table(conn, position)
        create_table(conn, playersposition)
        create_table(conn, coach)
        create_table(conn, coach_lead_team)
        create_table(conn, the_manager)
        create_table(conn, manager_manage_team)
        create_table(conn, sponser)
        create_table(conn, team_deal_sponser)
        create_table(conn, user)
        create_table(conn, user_favorite_players)
        create_table(conn, user_favorite_team)
        create_table(conn, transfer)
        create_table(conn, contract)
        create_table(conn, match_)
        create_table(conn, user_watch_match)
        create_table(conn, team_match)
        create_table(conn, stadium)
        create_table(conn, stadium_team)
        conn.commit()
    else: print("Error")

if __name__ == '__main__':
    main()