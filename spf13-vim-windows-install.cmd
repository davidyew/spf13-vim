REM @echo off
REM    Copyright 2014 Steve Francia
REM 
REM    Licensed under the Apache License, Version 2.0 (the "License");
REM    you may not use this file except in compliance with the License.
REM    You may obtain a copy of the License at
REM 
REM        http://www.apache.org/licenses/LICENSE-2.0
REM 
REM    Unless required by applicable law or agreed to in writing, software
REM    distributed under the License is distributed on an "AS IS" BASIS,
REM    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
REM    See the License for the specific language governing permissions and
REM    limitations under the License.


REM @if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
REM @if not exist "%HOME%" @set HOME=%USERPROFILE%

@if not exist "%HOME%" @set HOME=C:\src\vim

@set APP_PATH=%HOME%\spf13-vim
IF NOT EXIST "%APP_PATH%" (
    call git clone -b main https://github.com/davidyew/spf13-vim.git "%APP_PATH%"
) ELSE (
    @set ORIGINAL_DIR=%CD%
    echo updating spf13-vim
    chdir /d "%APP_PATH%"
    call git pull
    chdir /d "%ORIGINAL_DIR%"
    call cd "%APP_PATH%"
)

REM copy /y "%APP_PATH%\.vimrc" "%HOME%\.vimrc"
copy /y "%APP_PATH%\_vimrc" "%HOME%\_vimrc"

REM create directory junction to .vim
REM See https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/mklink
call mklink /J "%HOME%\.vim" "%APP_PATH%\.vim"

IF NOT EXIST "%APP_PATH%\.vim\bundle" (
    call mkdir "%APP_PATH%\.vim\bundle"
)

IF NOT EXIST "%HOME%/.vim/autoload/vim-plug" (
    call git clone https://github.com/junegunn/vim-plug.git "%HOME%/.vim/autoload/vim-plug"
) ELSE (
  REM Update Vim-Plug
  call cd "%HOME%/.vim/autoload/vim-plug"
  call git pull
  call cd %HOME%
)

call vim -u "%APP_PATH%\vimrc.bundles.vim" +PlugInstall! +PlugClean +qall
