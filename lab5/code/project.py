import sqlite3

def create_team(connect, team):
    sql = ''' INSERT INTO Team(teamID,teamName,LeagueName,teamWinNo,teamCupNo,teamLoseNo, PenaltyNo, Salary, teamInjuryNo)
                  VALUES(?,?,?,?,?,?,?,?,?) '''
    cur = connect.cursor()
    cur.execute(sql, team)
    connect.commit()


def create_players(connect, players):
    sql = '''INSERT INTO Players(playersID,playersName,playersNationality,playersGoalNo,playersCupNo,AssistNo,playersGameNo,DurationOfInjury,playersInjuryNo,playersCardNo,StartTheContract,EndTheContract,TeamID)
                    VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?) '''
    cur = connect.cursor()
    cur.execute(sql, players)
    connect.commit()

def create_position(connect, position):
    sql = '''INSERT INTO Position(posID,posName)
    VALUES (?,?)'''
    cur = connect.cursor()
    cur.execute(sql, position)
    connect.commit()


def create_PlayersPosition(connect, PlayersPosition):
    sql = '''INSERT INTO PlayersPosition(ppID,playersID,PositionID)
    VALUES (?,?,?)'''
    cur = connect.cursor()
    cur.execute(sql, PlayersPosition)
    connect.commit()

def create_coach(connect, coach):
    sql = '''INSERT INTO Coach(coachID,coachName,coachNationality,coachGameNo,coachCupNo)
    VALUES (?,?,?,?,?)'''
    cur = connect.cursor()
    cur.execute(sql, coach)
    connect.commit()

def create_CoachLeadTeam(connect, CoachLeadTeam):
    sql = '''INSERT INTO CoachLeadTeam(leadID,coachID,teamID,StartTheContract,EndTheContract)
    VALUES (?,?,?,?,?)'''
    cur = connect.cursor()
    cur.execute(sql, CoachLeadTeam)
    connect.commit()

def create_TheManager(connect, TheManager):
    sql = '''INSERT INTO TheManager(managerID,managerName,managerNationality,managerCupNo,managerGameNo)
    VALUES (?,?,?,?,?)'''
    cur = connect.cursor()
    cur.execute(sql, TheManager)
    connect.commit()

def create_Manager_Manage_Team(connect, Manager_Manage_Team):
    sql = '''INSERT INTO Manager_Manage_Team(manageID,managerID,teamID,StartTheContract,EndTheContract)
    VALUES (?,?,?,?,?)'''
    cur = connect.cursor()
    cur.execute(sql, Manager_Manage_Team)
    connect.commit()

def create_sponser(connect, sponser):
    sql = '''INSERT INTO Sponser(sponserID,sponserName)
    VALUES (?,?)'''
    cur = connect.cursor()
    cur.execute(sql, sponser)
    connect.commit()

def create_TeamDealSponser(connect, TeamDealSponser):
    sql = '''INSERT INTO TeamDealSponser(dealID,teamID,sponserID,DealTime,DealAmount)
    VALUES (?,?,?,?,?)'''
    cur = connect.cursor()
    cur.execute(sql, TeamDealSponser)
    connect.commit()

def create_user(connect, user):
    sql = '''INSERT INTO User(userID,userName,password,userEmail)
    VALUES (?,?,?,?)'''
    cur = connect.cursor()
    cur.execute(sql, user)
    connect.commit()

def create_UserFavoriteTeam(connect, UserFavoriteTeam):
    sql = '''INSERT INTO UserFavoriteTeam(favoriteTeamID,userID,teamID)
    VALUES (?,?,?)'''
    cur = connect.cursor()
    cur.execute(sql, UserFavoriteTeam)
    connect.commit()

def create_Transfer(connect, Transfer):
    sql = '''INSERT INTO Transfer(transferID,SellerTeam, PurchaserTeam)
    VALUES (?,?,?)'''
    cur = connect.cursor()
    cur.execute(sql, Transfer)
    connect.commit()

def create_Contract(connect, Contract):
    sql = '''INSERT INTO Contract(contractID,teamID,transferID)
    VALUES (?,?,?)'''
    cur = connect.cursor()
    cur.execute(sql, Contract)
    connect.commit()

def create_UserFavoritePlayers(connect, UserFavoritePlayers):
    sql = '''INSERT INTO UserFavoritePlayers(favoritePlayersID,userID ,playersID,grade)
    VALUES (?,?,?,?)'''
    cur = connect.cursor()
    cur.execute(sql, UserFavoritePlayers)
    connect.commit()

def create_Match_(connect, Match_):
    sql = '''INSERT INTO Match_(matchID,StaditumName,Year,Month,Day,HomeTeam,AwayTeam,homegame_or_not,matchGoalNo,matchCardNo)
    VALUES (?,?,?,?,?,?,?,?,?,?)'''
    cur = connect.cursor()
    cur.execute(sql, Match_)
    connect.commit()

def create_UserWatchMatch(connect, UserWatchMatch):
    sql = '''INSERT INTO UserWatchMatch(WatchID,matchID,userID)
    VALUES (?,?,?)'''
    cur = connect.cursor()
    cur.execute(sql, UserWatchMatch)
    connect.commit()

def create_TeamMatch(connect, TeamMatch):
    sql = '''INSERT INTO TeamMatch(TeamMatchID,matchID,teamID)
    VALUES (?,?,?)'''
    cur = connect.cursor()
    cur.execute(sql, TeamMatch)
    connect.commit()


def create_Stadium(connect, Stadium):
    sql = '''INSERT INTO Stadium(stadiumID,StaditumName,stadiumCityName,capacity,ConstructionAmount,ConstructionTime,TimeToStartConstruction,EndTimeConstructions)
    VALUES (?,?,?,?,?,?,?,?)'''
    cur = connect.cursor()
    cur.execute(sql, Stadium)
    connect.commit()

def create_StadiumTeam(connect, StadiumTeam):
    sql = '''INSERT INTO StadiumTeam(stID,teamID,stadiumID)
    VALUES (?,?,?)'''
    cur = connect.cursor()
    cur.execute(sql, StadiumTeam)
    connect.commit()


def main():
    connect = sqlite3.connect("socer_project.db")
    cursor = connect.cursor()
    print("Select One of them : Insert(1) , Delete(2) , Query(3):")
    n = int(input())
    if n == 1:
        print("Select a table: Team(1) , Players(2) , Position(3) , PlayersPosition(4) , Coach(5) , CoachLeadTeam(6)"
              " , TheManager(7) , Manager_Manage_Team(8) , Sponser(9) , TeamDealSponser(10) , User(11), UserFavoriteTeam(12)"
              " , Transfer(13) , Contract(14) , UserFavoritePlayers(15) , Match_(16) , UserWatchMatch(17) , TeamMatch(18)"
              ", Stadium(19) , StadiumTeam(20):")
        num_table = int(input())
        if num_table == 1:
            print("Team Table:")
            print("teamID,teamName,LeagueName,teamWinNo,teamCupNo,teamLoseNo,PenaltyNo,Salary,teamInjuryNo")
            select_team = """SELECT * FROM Team"""
            list_TeamName_League = []
            res = cursor.execute(select_team)
            temp = 0
            for row in res:
                print(row)
                temp = int(row[0])
                list_TeamName_League.append(row[1]+row[2])
            print("Insert you're data:")
            check = False
            unique_name = False
            id , name, league , winNo, cupNo, loseNo, penaltyNo, salary, injuryNo = input().split(" ")
            if temp != (int(id) - 1):
                print("id isn't correct.")
                check = True
            if name.isnumeric():
                print("name must be String.")
                check = True
            if league.isnumeric():
                print("league name must be Sting.")
                check = True
            if not id.isnumeric():
                print("id must be int.")
                check = True
            if not winNo.isnumeric():
                print("winNo must be int.")
                check = True
            if not cupNo.isnumeric():
                print("cupNo must be int.")
                check = True
            if not loseNo.isnumeric():
                print("loseNo must be int.")
                check = True
            if not penaltyNo.isnumeric():
                print("penalty must be int.")
                check = True
            if not salary.isnumeric():
                print("salary must be int.")
                check = True
            if not injuryNo.isnumeric():
                print("injuryNo must be int.")
                check = True
            for i in range(0,len(list_TeamName_League)):
                if (name + league) == list_TeamName_League[i]:
                    unique_name = True
            if unique_name == True:
                print("Team name must be unique.")
            if check == False and unique_name == False:
                team = (id , name, league , winNo, cupNo, loseNo, penaltyNo, salary, injuryNo)
                create_team(connect, team)
                print("insert is done.")
        elif num_table == 2:
            print("Players Table:")
            print("playersID,playersName,playersNationality,playersGoalNo,playersCupNo,AssistNo,playersGameNo,DurationOfInjury,playersInjuryNo,playersCardNo,StartTheContract,EndTheContract,TeamID")
            unique_name_nationality_id = []
            unique_attr = False
            select_players = """SELECT * FROM Players"""
            res = cursor.execute(select_players)
            temp = 0
            for row in res:
                print(row)
                temp = row[0]
                unique_name_nationality_id.append(str(row[1])+str(row[2])+str(row[12]))
            print("Insert you're data:")
            check = False
            playersID, playersName, playersNationality, playersGoalNo, playersCupNo, AssistNo, playersGameNo, DurationOfInjury, playersInjuryNo, playersCardNo, StartTheContract, EndTheContract, TeamID = input().split(" ")
            select_teamID = """SELECT teamID FROM Team"""
            Team_teamID = cursor.execute(select_teamID)
            flag = False
            for row in Team_teamID:
                if row[0] == int(TeamID):
                    flag = True
            if flag == True:
                if (temp != (int(playersID) - 1)):
                    print("id isn't correct.")
                    check = True
                if playersName.isnumeric():
                    print("name must be String.")
                    check = True
                if playersNationality.isnumeric():
                    print("nationality must be Sting.")
                    check = True
                if not playersGoalNo.isnumeric():
                    print("GoalNo must be int.")
                    check = True
                if not playersCupNo.isnumeric():
                    print("CupNo must be int.")
                    check = True
                if not AssistNo.isnumeric():
                    print("assistNo must be int.")
                    check = True
                if not playersGameNo.isnumeric():
                    print("GameNo must be int.")
                    check = True
                if not DurationOfInjury.isnumeric():
                    print("duration of injury must be int.")
                    check = True
                if not playersInjuryNo.isnumeric():
                    print("injury number must be int.")
                    check = True
                if not playersCardNo.isnumeric():
                    print("cardNo must be int.")
                    check = True
                if StartTheContract.isnumeric():
                    print("start the conteract must be Time.")
                    check = True
                if len(StartTheContract) < 10:
                    print("start the contract isn't correct.")
                    check = True
                elif StartTheContract[4] != "/" and StartTheContract[7] != "/":
                    print("shape of start the contract isn't correcr. it must be like 2020/01/01.")
                    check = True
                if EndTheContract.isnumeric():
                    print("end the contract must be int.")
                    check = True
                if len(EndTheContract) < 10:
                    print("start the contract isn't correct.")
                    check = True
                elif EndTheContract[4] != "/" and EndTheContract[7] != "/":
                    print("shape of start the contract isn't correcr. it must be like 2020/01/01.")
                    check = True
                for i in range(0, len(unique_name_nationality_id)):
                    if (str(playersName) + str(playersNationality) + str(TeamID)) == unique_name_nationality_id[i]:
                        unique_attr = True
                if unique_attr == True:
                    print("playersName and playersNationality and TeamID must be unique")
                if check == False and unique_attr == False:
                    players = (playersID, playersName, playersNationality, playersGoalNo, playersCupNo, AssistNo, playersGameNo,
                                DurationOfInjury, playersInjuryNo, playersCardNo, StartTheContract, EndTheContract, TeamID)
                    create_players(connect, players)
                    print("Insert is Done.")
            elif flag == False:
                print("TeamID don't exist.")
    elif n == 2:
        print("Select a table: Team(1) , Players(2) , Position(3) , PlayersPosition(4) , Coach(5) , CoachLeadTeam(6)"
              " , TheManager(7) , Manager_Manage_Team(8) , Sponser(9) , TeamDealSponser(10) , User(11), UserFavoriteTeam(12)"
              " , Transfer(13) , Contract(14) , UserFavoritePlayers(15) , Match_(16) , UserWatchMatch(17) , TeamMatch(18)"
              ", Stadium(19) , StadiumTeam(20):")
        num_table = int(input())
        if num_table == 1:
            print("Team Table:")
            print("teamID,teamName,LeagueName,teamWinNo,teamCupNo,teamLoseNo,PenaltyNo,Salary,teamInjuryNo")
            select_team = """SELECT * FROM Team"""
            res_team = cursor.execute(select_team)
            for row in res_team:
                print(row)
            select_player_teamID = """SELECT TeamID FROM Players"""
            res_players_teamID = cursor.execute(select_player_teamID)
            list_teamID = []
            for row in res_players_teamID:
                list_teamID.append(row[0])
            print("Enter TeamID to delete:")
            num_delete = input()
            flag = False
            for i in range(0, len(list_teamID)):
                if(int(num_delete) == list_teamID[i]):
                    flag = True
            if flag == True:
                print("You can't delete this team because, this team have players.")
            else:
                sql_delete = """DELETE FROM Team WHERE Team.teamID = %s"""%num_delete.strip()
                cursor.execute(sql_delete)
                connect.commit()
                print("delete is done.")
    elif n == 3:
        print("1. گلزن ترین بازیکن به همراه اسم و اسم باشگاه و تعداد گل او:")
        print("2. بازیکن هایی که صفر گل زده اند به همراه اسم و و نام باشگاه و پوزیشنی که در آن بازی می کنند:")
        print("3. کدام اسپانسر تعداد بیشتری قرار داد با تیم ها بسته است:")
        print("4. با توجه به کوئری بالا، تیم هایی که با اسپانسری که بیشترین تعداد قرار داد را دارند به همراه اسم لیگ آن ها:")
        print("5. بازیکن هایی که کاربر حجت در یک بازی مشاهده کرده  است")
        print("6. بازیکنانی که در تیمی که بزرگترین ورزشگاه را دارد را بازی می کنند به همراه ملیت آن ها:")
        print("7. بازیکنانی که از قبل سال 2009 با یک تیم قرار داد بسته اند به همراه اسم تیم و ملیت آن ها:")
        print("8. بازیکنانی که قبل از ساخت یا تعمیر ورزشگاه عضو باشگاه شده اند به همراه اسم تیم و ملیت:")
        print("9. بازیکنان و مربیانی که در یک تیم از یک کشور هستند:")
        print("10. بازیکنانی که در پر کارت ترین بازی شرکت کردند به همراه اسم تیم و اسم لیگ:")
        print("11. اسپانسر های تیم های لیگ Premier به همراه اسم تیم:")
        print("12. اسم استادیوم ها و تیم ها و اسپانسرهایی که باشگاه FC Bayern Munich از آن ها بازیکن خریداری کرده است:")
        print("13. اسم تیم و مدیران و تیم هایی که مقابل آن ها مهمان بوده است که اسم اسپانسر آن تیم Yokohama است:")
        print("Select one of them:")
        num_query = int(input())
        if num_query == 1:
            sql_select = """SELECT team, name, max(GoalNo) FROM(
                    SELECT Players.playersGoalNo As GoalNo, Players.playersName As name, Team.teamName AS team
                    FROM Players, Team
                    WHERE Team.teamID = Players.TeamID
                    GROUP By Players.playersName
                    ORDER By Players.playersGoalNo)
                    """
            res = cursor.execute(sql_select)
            for row in res:
                print(row)
        if num_query == 2:
            sql_select = """SELECT Players.playersGoalNo As GoalNo, Players.playersName As name, Team.teamName AS team, Position.posName
                FROM PlayersPosition, Players, Position, Team
                WHERE Team.teamID = Players.TeamID and Players.playersGoalNo = 0 and Players.playersID = PlayersPosition.playersID and Position.posID = PlayersPosition.PositionID
                GROUP By Players.playersName
                """
            res = cursor.execute(sql_select)
            for row in res:
                print(row)
        if num_query == 3:
            sql_select = """SELECT Sponser.sponserName , count(*) As Count
                    FROM Sponser, Team, TeamDealSponser
                    WHERE Team.teamID = TeamDealSponser.teamID and Sponser.sponserID = TeamDealSponser.sponserID
                    GROUP By Sponser.sponserName
                    ORDER By count(*) DESC
                    LIMIT 1
                    """
            res = cursor.execute(sql_select)
            for row in res:
                print(row)
        if num_query == 4:
            sql_select = """SELECT Team.teamName
                FROM Team, Sponser, TeamDealSponser
                WHERE TeamDealSponser.sponserID = Sponser.sponserID and TeamDealSponser.teamID = Team.teamID
                GROUP By Team.teamName
                HAVING Sponser.sponserName = (SELECT Sponser.sponserName 
                FROM Sponser, Team, TeamDealSponser
                WHERE Team.teamID = TeamDealSponser.teamID and Sponser.sponserID = TeamDealSponser.sponserID 
                GROUP By Sponser.sponserName
                ORDER By count(*) DESC
                LIMIT 1)
                """
            res = cursor.execute(sql_select)
            for row in res:
                print(row)
        if num_query == 5:
            sql_select = """SELECT Players.playersName
                FROM PlayersPosition, Players, Position, User, UserWatchMatch, Match_, Team, TeamMatch
                WHERE UserWatchMatch.matchID == Match_.matchID and TeamMatch.matchID = Match_.matchID and User.userID = UserWatchMatch.userID and 
                TeamMatch.teamID = Team.teamID and Team.teamID = Players.TeamID
                GROUP By Players.playersName, User.userID
                HAVING User.userName = 'Hojjat';
                """
            res = cursor.execute(sql_select)
            for row in res:
                print(row)
        if num_query == 6:
            sql_select = """SELECT Players.playersName, Players.playersNationality
                            FROM Players, Team, Stadium, StadiumTeam
                            WHERE Team.teamID = StadiumTeam.teamID and Stadium.stadiumID = StadiumTeam.stadiumID
                            and Players.TeamID = Team.teamID
                            GROUP By Players.playersName
                            HAVING Stadium.StaditumName = (SELECT name FROM
                            (SELECT Stadium.StaditumName AS name, max(Stadium.capacity) AS cap
                            FROM Stadium))
                            """
            res = cursor.execute(sql_select)
            for row in res:
                print(row)
        if num_query == 7:
            sql_select = """SELECT name, nationality, team_name FROM(
                    SELECT CAST(sub_Date AS INTEGER) As Contract, name, nationality, team_name FROM(
                    SELECT substr(Date,0,5) As sub_Date, name, nationality, team_name FROM(
                    SELECT Players.StartTheContract AS Date, Players.playersName AS name, Players.playersNationality As nationality, Team.teamName AS team_name
                    FROM Players, Team
                    WHERE Players.TeamID = Team.teamID)) 
                    WHERE Contract <2009)
                    """
            res = cursor.execute(sql_select)
            for row in res:
                print(row)
        if num_query == 8:
            sql_select = """SELECT StartTime,Contract,name, nationality, team_name
                        FROM(SELECT StartTime, CAST(sub_Date AS INTEGER) As Contract, name, nationality, team_name
                        FROM(SELECT CAST(start_time AS INTEGER) AS StartTime, substr(Date,0,5) As sub_Date, name, nationality, team_name
                        FROM(SELECT Stadium.TimeToStartConstruction As start_time, Players.StartTheContract AS Date, Players.playersName AS name, Players.playersNationality As nationality, Team.teamName AS team_name
                        FROM Stadium, Players, Team, StadiumTeam
                        WHERE Team.teamID = Players.TeamID and Team.teamID = StadiumTeam.teamID and Stadium.stadiumID = StadiumTeam.stadiumID))
                        WHERE StartTime>Contract
                        GROUP By StartTime, Contract, nationality, team_name)
                        """
            res = cursor.execute(sql_select)
            for row in res:
                print(row)
        if num_query == 9:
            sql_select = """SELECT Coach.coachName AS coach_name, Team.teamName AS team_name, Players.playersName
                        FROM Coach, CoachLeadTeam, Team, Players
                        WHERE Coach.coachID = CoachLeadTeam.coachID and Team.teamID = CoachLeadTeam.teamID
                        and Players.TeamID = Team.teamID
                        GROUP By Coach.coachName, Team.teamName, Players.playersName
                        HAVING Players.playersNationality = Coach. coachNationality
                        """
            res = cursor.execute(sql_select)
            for row in res:
                print(row)
        if num_query == 10:
            sql_select = """SELECT Players.playersName , Team.teamName, Team.LeagueName
                        FROM Players, Team
                        WHERE Players.TeamID = Team.teamID
                        GROUP by Players.playersName 
                        HAVING Team.teamName = (SELECT home
                        FROM(SELECT max(Match_.matchCardNo), Match_.AwayTeam AS away, Match_.HomeTeam AS home
                        FROM Match_, Team, TeamMatch))
                        OR Team.teamName = (SELECT away
                        FROM(SELECT max(Match_.matchCardNo), Match_.AwayTeam AS away, Match_.HomeTeam AS home
                        FROM Match_, Team, TeamMatch))
                        """
            res = cursor.execute(sql_select)
            for row in res:
                print(row)
        if num_query == 11:
            sql_select = """SELECT Sponser.sponserName, Team.teamName
                        FROM Team, Sponser, TeamDealSponser
                        WHERE Team.LeagueName = 'Premier'and Team.teamID = TeamDealSponser.teamID and Sponser.sponserID = TeamDealSponser.sponserID
                        GROUP By Sponser.sponserName, Team.teamName
                        """
            res = cursor.execute(sql_select)
            for row in res:
                print(row)
        if num_query == 12:
            sql_select = """SELECT Stadium.StaditumName, Team.teamName, Sponser.sponserName
                    FROM Team, Transfer, Stadium, StadiumTeam, Sponser, TeamDealSponser
                    WHERE Transfer.PurchaserTeam = 'FC Bayern Munich'
                    and Team.teamName = Transfer.SellerTeam
                    and Team.teamID = StadiumTeam.teamID
                    and StadiumTeam.stadiumID = Stadium.stadiumID
                    and Team.teamID = TeamDealSponser.teamID
                    and TeamDealSponser.sponserID = Sponser.sponserID
                    """
            res = cursor.execute(sql_select)
            for row in res:
                print(row)
        if num_query == 13:
            sql_select = """SELECT TheManager.managerName, Team.teamName, Match_.HomeTeam
                        FROM Sponser, TeamDealSponser, Team , Manager_Manage_Team, TheManager, Match_, TeamMatch
                        WHERE Sponser.sponserName = 'Yokohama'
                        and Sponser.sponserID = TeamDealSponser.sponserID
                        and Team.teamID = TeamDealSponser.teamID
                        and Team.teamID = Manager_Manage_Team.teamID
                        and Manager_Manage_Team.managerID = TheManager.managerID
                        and Match_. AwayTeam = Team.teamName
                        GROUP By Match_.HomeTeam
                        """
            res = cursor.execute(sql_select)
            for row in res:
                print(row)

if __name__ == '__main__':
    main()