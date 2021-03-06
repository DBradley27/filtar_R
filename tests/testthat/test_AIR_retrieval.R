output = get_AIR_file('hsa_HeLa.APA.txt','hsa_HeLa.utr.lengths.tsv')

context('test get_AIR_file')

test_that('first column is valid', {
	expect_match(output$id, 'ENS(MUS)?T[0-9]+.[0-9][0-9]?')
})

test_that('second column is valid', {
        expect_match(output$rel_start_pos %>% as.character(), '[0-9]{1,5}')
})

test_that('third column is valid', {
        expect_match(output$rel_end_pos %>% as.character(), '[0-9]{1,5}')
})

test_that('fourth column is valid', {
        expect_match(output$AIR %>% as.character(), '[0-9]{1,3}.?[0-9]?')
})

test_that('negative strand transcript ENST00000007516.7 has correct first start position', {
        expect_equal(1, output[output$id == 'ENST00000007516.7',c('rel_start_pos')] %>% dplyr::slice(1) %>% as.double)
})

test_that('negative strand transcript (ENST00000007516).7 has correct first end position', {
	expect_equal(23581173 - 23581096, output[output$id == 'ENST00000007516.7',c('rel_end_pos')] %>% dplyr::slice(1) %>% as.double, 1)
})

test_that('negative strand transcript (ENST00000007516.7) has correct second start position', {
        expect_equal(23581173 - 23581096 + 1, output[output$id == 'ENST00000007516.7',c('rel_start_pos')] %>% dplyr::slice(2) %>% as.double, 1)
})

test_that('negative strand transcript (ENST00000007516.7) has correct second end position', {
        expect_equal(23581173 - 23581013, output[output$id == 'ENST00000007516.7',c('rel_end_pos')] %>% dplyr::slice(2) %>% as.double, 1)
})

test_that('negative strand transcript (ENST00000007516.7) has correct first AIR', {
        expect_equal(100, output[output$id == 'ENST00000007516.7',c('AIR')] %>% dplyr::slice(1) %>% as.double)
})

test_that('negative strand transcript (ENST00000007516.7) has correct second AIR', {
        expect_equal((9.06/31.38) * 100, output[output$id == 'ENST00000007516.7',c('AIR')] %>% dplyr::slice(2) %>% as.double)
})

test_that('positive strand transcript (ENST00000013034.3) has correct first start position', {
        expect_equal(1, output[output$id == 'ENST00000013034.3',c('rel_start_pos')] %>% dplyr::slice(1) %>% as.double)
})

test_that('positive strand transcript (ENST00000013034.3) has correct first end position', {
        expect_equal(51161870 - 51161728, output[output$id == 'ENST00000013034.3',c('rel_end_pos')] %>% dplyr::slice(1) %>% as.double, 1)
})

test_that('positive strand transcript (ENST00000013034.3) has correct second start position', {
        expect_equal(51161870 - 51161728 + 1, output[output$id == 'ENST00000013034.3',c('rel_start_pos')] %>% dplyr::slice(2) %>% as.double, 1)
})

test_that('positive strand transcript (ENST00000013034.3) has correct second end position', {
        expect_equal(51161897 - 51161728, output[output$id == 'ENST00000013034.3',c('rel_end_pos')] %>% dplyr::slice(2) %>% as.double, 1)
})

test_that('positive strand transcript (ENST00000013034.3) has correct first AIR', {
        expect_equal(100, output[output$id == 'ENST00000013034.3',c('AIR')] %>% dplyr::slice(1) %>% as.double)
})

test_that('positive strand transcript (ENST00000013034.3) has correct second AIR', {
        expect_equal((19.50/39.46) * 100, output[output$id == 'ENST00000013034.3',c('AIR')] %>% dplyr::slice(2) %>% as.double)
})
