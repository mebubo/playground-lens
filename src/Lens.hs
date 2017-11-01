{-# LANGUAGE RankNTypes #-}

module Lens where

type Lens s t a b = forall f. Functor f => (a -> f b) -> s -> f t

_2 :: Lens (c, a) (c, d) a d
_2 f (c, a) = (,) c <$> f a

