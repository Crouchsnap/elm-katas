module Tennis exposing (Game(..), init, player1Scores, player2Scores, scoreToString)


init : Game
init =
    Points ( 0, 0 )


type Game
    = Points ( Int, Int )
    | Deuce (Maybe Player)
    | Winner Player


type Player
    = Player1
    | Player2


checkForDeuce : Game -> Bool
checkForDeuce game =
    case game of
        Points ( player1Score, player2Score ) ->
            if player1Score > 2 && player1Score == player2Score then
                True

            else
                False

        _ ->
            False


player1Scores : Game -> Game
player1Scores game =
    case game of
        Points ( player1Score, player2Score ) ->
            let
                points =
                    Points ( player1Score + 1, player2Score )
            in
            if checkForDeuce points then
                Deuce Nothing

            else if player1Score == 3 then
                Winner Player1

            else
                points

        Deuce Nothing ->
            Deuce (Just Player1)

        Deuce (Just Player2) ->
            Deuce Nothing

        Deuce (Just Player1) ->
            Winner Player1

        Winner player ->
            Winner player


player2Scores : Game -> Game
player2Scores game =
    case game of
        Points ( player1Score, player2Score ) ->
            let
                points =
                    Points ( player1Score, player2Score + 1 )
            in
            if checkForDeuce points then
                Deuce Nothing

            else
                points

        Deuce Nothing ->
            Deuce (Just Player2)

        Deuce (Just Player1) ->
            Deuce Nothing

        Deuce (Just Player2) ->
            Winner Player2

        Winner player ->
            Winner player


scoreToString : Game -> String
scoreToString game =
    case game of
        Points ( player1Score, player2Score ) ->
            pointsToString player1Score ++ "-" ++ pointsToString player2Score

        Deuce Nothing ->
            "Deuce"

        Deuce (Just Player2) ->
            "Advantage Player 2"

        Deuce (Just Player1) ->
            "Advantage Player 1"

        Winner Player1 ->
            "Player 1 Wins"

        Winner Player2 ->
            "Player 2 Wins"


pointsToString : Int -> String
pointsToString points =
    case points of
        0 ->
            "Love"

        1 ->
            "15"

        2 ->
            "30"

        3 ->
            "40"

        _ ->
            "unhandled score"
