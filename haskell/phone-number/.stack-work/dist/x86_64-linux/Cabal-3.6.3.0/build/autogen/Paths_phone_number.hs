{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_phone_number (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,6,1,8] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/mak/exercism/haskell/phone-number/.stack-work/install/x86_64-linux/ce9025d6e68cec4e8d34dd27680376cf92a7be1a9407ada054ac4c573caf063f/9.2.7/bin"
libdir     = "/home/mak/exercism/haskell/phone-number/.stack-work/install/x86_64-linux/ce9025d6e68cec4e8d34dd27680376cf92a7be1a9407ada054ac4c573caf063f/9.2.7/lib/x86_64-linux-ghc-9.2.7/phone-number-1.6.1.8-2WutNH6HZB3SY0UZjXXYA"
dynlibdir  = "/home/mak/exercism/haskell/phone-number/.stack-work/install/x86_64-linux/ce9025d6e68cec4e8d34dd27680376cf92a7be1a9407ada054ac4c573caf063f/9.2.7/lib/x86_64-linux-ghc-9.2.7"
datadir    = "/home/mak/exercism/haskell/phone-number/.stack-work/install/x86_64-linux/ce9025d6e68cec4e8d34dd27680376cf92a7be1a9407ada054ac4c573caf063f/9.2.7/share/x86_64-linux-ghc-9.2.7/phone-number-1.6.1.8"
libexecdir = "/home/mak/exercism/haskell/phone-number/.stack-work/install/x86_64-linux/ce9025d6e68cec4e8d34dd27680376cf92a7be1a9407ada054ac4c573caf063f/9.2.7/libexec/x86_64-linux-ghc-9.2.7/phone-number-1.6.1.8"
sysconfdir = "/home/mak/exercism/haskell/phone-number/.stack-work/install/x86_64-linux/ce9025d6e68cec4e8d34dd27680376cf92a7be1a9407ada054ac4c573caf063f/9.2.7/etc"

getBinDir     = catchIO (getEnv "phone_number_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "phone_number_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "phone_number_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "phone_number_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "phone_number_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "phone_number_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
