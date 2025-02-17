---@meta
-- luacheck: ignore
local lpdb = {}

---@class LpdbBaseData
---@field pageid integer
---@field pagename string
---@field namespace integer
---@field objectname string
---@field extradata table
---@field [any] any

---@class broadcasters:LpdbBaseData
---@field id string
---@field name string
---@field page string
---@field position string
---@field language string
---@field flag string
---@field weight number
---@field date string
---@field parent string
---@field year_date string

---@class datapoint:LpdbBaseData
---@field type string
---@field name string
---@field information string
---@field image string
---@field imagedark string
---@field date string

---@class placement:LpdbBaseData
---@field tournament string
---@field series string
---@field parent string
---@field startdate string
---@field date string #end date
---@field placement string
---@field prizemoney number
---@field individualprizemoney number
---@field prizepoolindex integer
---@field weight number
---@field mode string
---@field type string
---@field liquipediatier string # to be converted to integer
---@field liquipediatiertype string
---@field publishertier string
---@field icon string
---@field icondark string
---@field game string
---@field lastvsdata table
---@field opponentname string
---@field opponenttemplate string
---@field opponenttype OpponentType
---@field opponentplayers table
---@field qualifier string
---@field qualifierpage string
---@field qualifierurl string

---@class player:LpdbBaseData
---@field id string
---@field alternativeid string
---@field name string
---@field localizedname string
---@field iamge string
---@field type string
---@field nationality string
---@field nationality2 string
---@field nationality3 string
---@field region string
---@field birthdate string
---@field deathdate string
---@field teampagename string
---@field teamtemplate string
---@field links table
---@field status string
---@field earnings integer
---@field earningsbyyear table

---@class squadplayer:LpdbBaseData
---@field id string
---@field link string
---@field name string
---@field nationality string
---@field position string
---@field role string
---@field type 'player'|'staff'
---@field newteam string
---@field teamtemplate string
---@field newteamtemplate string
---@field joindate string
---@field leavedate string
---@field inactivedate string

---@class team:LpdbBaseData
---@field name string
---@field locations table
---@field region string
---@field logo string
---@field logodark string
---@field status string
---@field createdate string
---@field disbanddate string
---@field earnings integer
---@field earnignsbyyear table
---@field template string
---@field links table

---@class tournament:LpdbBaseData
---@field name string
---@field shortname string
---@field tickername string
---@field banner string
---@field bannerdark string
---@field icon string
---@field icondark string
---@field seriespage string
---@field previous string
---@field previous2 string
---@field next string
---@field next2 string
---@field game string
---@field mode string
---@field patch string
---@field endpatch string
---@field type string
---@field organizers table
---@field startdate string
---@field enddate string
---@field sortdate string
---@field locations table
---@field prizepool number
---@field participantsnumber integer
---@field liquipediatier string # to be converted to integer
---@field liquipediatiertype string
---@field publishertier string
---@field status string
---@field maps string
---@field format string
---@field sponsors table

---@class company:LpdbBaseData
---@field name string
---@field image string
---@field imagedark string
---@field locations table
---@field parentcompany string
---@field sistercompany string
---@field industry string
---@field foundeddate string
---@field defunctdate string
---@field defunctfate string
---@field links table

---@class externalmedialink:LpdbBaseData
---@field title string
---@field translatedtitle string
---@field link string
---@field date string
---@field authors table
---@field language string
---@field publisher string
---@field type string

---@class series:LpdbBaseData
---@field name string
---@field abbreviation string
---@field image string
---@field imagedark string
---@field icon string
---@field icondark string
---@field game string
---@field type string
---@field organizers table
---@field locations table
---@field prizepool number
---@field liquipediatier string # to be converted to integer
---@field liquipediatiertype string
---@field publishertier string
---@field launcheddate string
---@field defunctdate string
---@field defunctfate string
---@field links table

---@class settings:LpdbBaseData
---@field name string
---@field reference string
---@field lastupdated string
---@field keys table
---@field gamesettings table
---@field viewsettings table
---@field type string

---@class scoreBoard
---@field match {w: number, d: number, l: number}
---@field overtime {w: number, d: number, l: number}
---@field game {w: number, d: number, l: number}
---@field points number
---@field diff number
---@field buchholz number

---@class standingsentry:LpdbBaseData
---@field parent string
---@field standingsindex integer
---@field opponenttype OpponentType
---@field opponentname string
---@field opponenttemplate string
---@field opponentplayers table
---@field placement string
---@field definitestatus string
---@field currentstatus string
---@field placementchange string
---@field scoreboard scoreBoard
---@field roundindex integer
---@field slotindex integer

---@class standingstable:LpdbBaseData
---@field parent string
---@field standingsindex integer
---@field title string
---@field tournament string
---@field section string
---@field type 'league'|'swiss'
---@field matches string[]
---@field config {hasdraw: string, hasovertime: string, haspoints: string}

---@class transfer:LpdbBaseData
---@field staticid string # not yet in use
---@field player string
---@field nationality string
---@field fromteamtemplate string
---@field toteamtemplate string
---@field role1 string
---@field role2 string
---@field reference table
---@field date string
---@field wholeteam integer

---@class gear:LpdbBaseData
---@field date string
---@field reference string
---@field input table
---@field display string
---@field audio table
---@field chair table

---@class match2:LpdbBaseData
---@field match2id string
---@field match2bracketid string
---@field winner integer
---@field finished integer
---@field mode string
---@field type string
---@field section string
---@field game string
---@field patch string
---@field date string
---@field dateexact integer
---@field stream table
---@field links table
---@field bestof integer
---@field vod string
---@field tournament string
---@field parent string
---@field tickername string
---@field shortname string
---@field series string
---@field icon string
---@field icondark string
---@field liquipediatier string # to be converted to integer
---@field liquipediatiertype string
---@field publishertier string
---@field match2bracketdata table
---@field match2opponents match2opponent[]
---@field match2games match2game[]

---@class match2opponent:LpdbBaseData
---@field match2id string
---@field match2opponentid integer
---@field type OpponentType
---@field name string
---@field template string
---@field score number
---@field placement integer
---@field status string
---@field match2players match2player[]

---@class match2game:LpdbBaseData
---@field match2id string
---@field match2gameid integer
---@field subgroup integer
---@field winner integer
---@field opponents table[]
---@field status string
---@field mode string
---@field type string
---@field game string
---@field patch string
---@field tournament string
---@field date string
---@field vod string
---@field map string
---@field length string
---@field parent string

---@class match2player:LpdbBaseData
---@field match2id string
---@field match2opponentid integer
---@field match2playerid integer
---@field name string
---@field displayname string
---@field flag string

---@param obj table
---@return string
---Encode a table to a JSON object. Errors are raised if the passed value cannot be encoded in JSON.
function lpdb.lpdb_create_json(obj)
	-- TODO This is not fully correct mock (should be {"1": ..., "2": ...} instead of [...,...])
	return require('3rd.jsonlua.mock_json'):encode(obj)
end

---@param obj any[]
---@return string
---Encode an Array to a JSON array. Errors are raised if the passed value cannot be encoded in JSON.
function lpdb.lpdb_create_array(obj) end

return lpdb
