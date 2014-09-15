import datetime

CBRO = 'http://crawl.berotato.org/crawl/'

USE_TEST = False

TEST_YEAR = USE_TEST and '2014'
TEST_VERSION = USE_TEST and '0.15'
TEST_START_TIME = USE_TEST and (TEST_YEAR + '0915')
TEST_END_TIME   = USE_TEST and (TEST_YEAR + '1001')
TEST_CLAN_DEADLINE = (USE_TEST and
                     datetime.datetime(2014, 9, 15, 0))
TEST_HARE_START_TIME = USE_TEST and (TEST_YEAR + '0915')
TEST_LOGS = USE_TEST and ['cbro-logfile-0.15']

TEST_MILESTONES = USE_TEST and ['cbro-milestones-0.15']
