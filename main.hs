module Main where

-- manual liftA2
myLiftA2 :: Applicative f => (a -> b -> c) -> f a -> f b -> f c
myLiftA2 f x y = f <$> x <*> y

exampleFunctor :: Maybe Int
exampleFunctor = fmap (+3) (Just 7)

wrappedFunction :: Maybe (Int -> Int)
wrappedFunction = Just (*2)

wrappedValue :: Maybe Int
wrappedValue = Just 10

exampleApplicative :: Maybe Int
exampleApplicative = wrappedFunction <*> wrappedValue

examplePure :: Maybe Int
examplePure = pure 42

lawIdentity :: Maybe Int
lawIdentity = pure id <*> Just 99

lawHomomorphism :: Maybe Int
lawHomomorphism = pure (+1) <*> pure 3

addMaybes :: Maybe Int -> Maybe Int -> Maybe Int
addMaybes x y = (+) <$> x <*> y

exampleEffects :: Maybe Int
exampleEffects = addMaybes (Just 5) (Just 7)

exampleEffectsFail :: Maybe Int
exampleEffectsFail = addMaybes (Just 5) Nothing

exampleList :: [Int]
exampleList = (+) <$> [1,2] <*> [10,20]

exampleLiftA2 :: Maybe Int
exampleLiftA2 = myLiftA2 (*) (Just 3) (Just 4)

main :: IO ()
main = do
  putStrLn "=== Applicative Demo App ==="
  print exampleFunctor
  print exampleApplicative
  print examplePure
  print lawIdentity
  print lawHomomorphism
  print exampleEffects
  print exampleEffectsFail
  print exampleList
  print exampleLiftA2
