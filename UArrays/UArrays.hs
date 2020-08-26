import Data.Array.Unboxed
import Data.Array.ST
import Control.Monad
import Control.Monad.ST
import Data.STRef


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

aLargeListDoubled :: [Int]
aLargeListDoubled = map (*2) aLargeList

-- GHCi, version 8.6.5: http://www.haskell.org/ghc/  :? for help
-- Prelude> :l UArrays.hs
-- [1 of 1] Compiling Main             ( UArrays.hs, interpreted )
-- Ok, one module loaded.
-- *Main> :set +s
-- *Main> length aLargeListDoubled
-- 10000000
-- (7.56 secs, 1,680,064,952 bytes)
-- *Main> length aLargeListDoubled
-- 10000000
-- (0.26 secs, 63,960 bytes)
-- *Main> 



-- Create Uarray Index type member of Enum and Bounded

mostlyFalseArray :: UArray Int Bool
mostlyFalseArray = array (0,9) [(5,True)]

-- indexing from 1 , not from 0

oneIndexArray :: UArray Int Bool 
oneIndexArray = array (1,10) $ zip [1 ..10] $ cycle [True]


xyArray :: UArray Int Bool
xyArray = array (0,5) [(2,True),(4,True)]

-- initally all will be 0 
beansBuckets :: UArray Int Int
beansBuckets = array (0,9) []


-- // operator

newBB :: UArray Int Int
newBB = beansBuckets // [(1,100),(4,50)]

-- adding 2 beans to every bucket

newBBB = accum (+) newBB $ zip [0 .. 9] $ cycle [2]


-- usind STUArrays 

listToSTUArray' :: [Int] -> ST s (STUArray s Int Int) 
listToSTUArray' vals = do 
    let end = length vals -1
    stArray <- newArray (0,end) 0
    return stArray


listToSTUArray :: [Int] -> ST s (STUArray s Int Int)
listToSTUArray vals = do
     let end =  length vals - 1
     myArray <- newArray (0,end) 0
     forM_ [0 .. end] $ \i -> do
       let val = vals !! i
       writeArray myArray i val
     return myArray

-- take values out of STUArray with the function
--  runSTUArray :: ST s (STUArray s i e) -> UArray i e

-- we can treat the function as pure
listToUArray' :: [Int] -> UArray Int Int
listToUArray' vals = runSTUArray $ listToSTUArray vals


-- A common way of working with STUArrays and runSTUArray
-- main functions newArray ; readArray ; writeArray

listToUArray :: [Int] -> UArray Int Int
listToUArray vals = runSTUArray $ do
     let end =  length vals - 1
     myArray <- newArray (0,end) 0
     forM_ [0 .. end] $ \i -> do
         let val = vals !! i
         writeArray myArray i val
     return myArray

-- example of ST monad 
-- common functions newSTref ; readSTRef ; writeSTRef 

swapST :: (Int,Int) -> (Int,Int)
swapST (x,y) = runST $ do
   x' <- newSTRef x
   y' <- newSTRef y
   writeSTRef x' y
   writeSTRef y' x
   xfinal <- readSTRef x'
   yfinal <- readSTRef y'
   return (xfinal,yfinal)

main :: IO() 
main = return()

