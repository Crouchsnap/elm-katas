module TennisTest exposing (..)

import Expect
import Tennis
import Test exposing (..)


suite : Test
suite =
    describe "Tennis"
        [ test "new game" <|
            \() ->
                Tennis.init
                    |> Tennis.score
                    |> Expect.equal "Love-Love"
        ]
