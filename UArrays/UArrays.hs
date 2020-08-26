import Data.Array.Unboxed

-- create a large list

aLargeList :: [Int]
aLargeList = [1 .. 10000000]

-- create UArray Int Int

aLargeArray :: UArray Int Int
aLargeArray = array (0,9999999) []

-- output from compiler 
-- GHCi, version 8.6.5: http://www.haskell.org/ghc/  :? for help
-- Prelude> :l UArrays.hs
-- [1 of 1] Compiling Main             ( UArrays.hs, interpreted )
-- Ok, one module loaded.
-- *Main> :set +s
-- *Main> aLargeList !! 9999999
-- 10000000
-- (3.07 secs, 800,064,752 bytes)
-- *Main> aLargeList !! 9999999
-- 10000000
-- (0.10 secs, 63,960 bytes)
-- *Main> aLargeArray ! 9999999
-- 0
-- (0.05 secs, 80,059,168 bytes)
-- *Main> aLargeArray ! 9999999
-- 0
-- (0.01 secs, 58,936 bytes)
-- *Main> 


