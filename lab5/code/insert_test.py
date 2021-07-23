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

def main():
    connect = sqlite3.connect("db_pro.db")
    try:
        team = (1, 'Barcelona', 'Laliga', 600, 74, 200, 100, 13799999.999999999999, 10)
        create_team(connect, team)
        team = (2, 'Liverpool', 'Premier', 500, 40, 210, 30, 9000000.0, 10)
        create_team(connect, team)
        team = (3, 'Ajax', 'Eredivisie', 450, 35, 130, 40, 5000000.0, 20)
        create_team(connect, team)
    except sqlite3.IntegrityError:
        print("TeamID,teamName,LeagueNameis UNIQUE")

    players = (1,'Lionel Messi','Argentina',750,40,221,850,10.0,2,10,'2003/01/01','2022/01/01',1)
    create_players(connect, players)
    players = (8,'Mateo Kovačić','Austria',20,12,41,250,3.0,1,13,'2018/01/03','2024/01/09',9)
    teamID = """SELECT teamID FROM Team"""
    c = connect.cursor()
    temp = c.execute(teamID)
    flag = False
    for row in temp:
        if players[12] == row[0]:
            flag = True
    if flag == True:
        create_players(connect, players)
    else:
        print("TeamID don't exist")


if __name__ == '__main__':
    main()