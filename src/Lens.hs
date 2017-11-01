{-# LANGUAGE RankNTypes #-}

module Lens where

type Lens s t a b = forall f. Functor f => (a -> f b) -> s -> f t

type Traversal s t a b = forall f. Applicative f => (a -> f b) -> s -> f t

_2 :: Lens (c, a) (c, d) a d
_2 f (c, a) = (,) c <$> f a

both :: Traversal (a, a) (b, b) a b
both f (a, b) = (,) <$> f a <*> f b

newtype Const a b = Const { getConst :: a }

instance Functor (Const a) where
    fmap _ (Const x) = Const x

view :: Lens s t a b -> s -> a
view l = getConst . l Const

newtype Id a = Id { getId :: a }

instance Functor Id where
    fmap f (Id a) = Id (f a)

instance Applicative Id where
    pure a = Id a
    Id f <*> Id a = Id $ f (a)

over :: ((a -> Id b) -> s -> Id t) -> (a -> b) -> s -> t
over l f = getId . l (Id . f)

set :: Lens s t a b -> b -> s -> t
set l = over l . const
