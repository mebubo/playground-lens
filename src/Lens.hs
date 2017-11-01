{-# LANGUAGE RankNTypes #-}

module Lens where

type Lens s t a b = forall f. Functor f => (a -> f b) -> s -> f t

_2 :: Lens (c, a) (c, d) a d
_2 f (c, a) = (,) c <$> f a

newtype Const a b = Const { getConst :: a }

instance Functor (Const a) where
    fmap _ (Const x) = Const x

view :: Lens s t a b -> s -> a
view l = getConst . l Const

newtype Id a = Id { getId :: a }

instance Functor Id where
    fmap f (Id a) = Id (f a)

over :: Lens s t a b -> (a -> b) -> s -> t
over l f = getId . l (fmap f . Id)

set :: Lens s t a b -> b -> s -> t
set l = over l . const
