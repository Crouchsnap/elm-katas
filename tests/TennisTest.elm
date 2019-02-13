module TennisTest exposing (suite)

import Expect
import Tennis
import Test exposing (..)


suite : Test
suite =
    describe "Tennis"
        [ test "new game" <|
            \_ ->
                Tennis.init
                    |> Tennis.scoreToString
                    |> Expect.equal "Love-Love"
        , test "player 1 scores" <|
            \_ ->
                Tennis.init
                    |> Tennis.player1Scores
                    |> Tennis.scoreToString
                    |> Expect.equal "15-Love"
        , test "player 2 scores" <|
            \_ ->
                Tennis.init
                    |> Tennis.player2Scores
                    |> Tennis.scoreToString
                    |> Expect.equal "Love-15"
        , test "deuce" <|
            \_ ->
                Tennis.init
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.scoreToString
                    |> Expect.equal "Deuce"
        , test "deuce player2scores" <|
            \_ ->
                Tennis.init
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player2Scores
                    |> Tennis.scoreToString
                    |> Expect.equal "Deuce"
        , test "adv player 1" <|
            \_ ->
                Tennis.init
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player2Scores
                    |> Tennis.player1Scores
                    |> Tennis.scoreToString
                    |> Expect.equal "Advantage Player 1"
        ]
