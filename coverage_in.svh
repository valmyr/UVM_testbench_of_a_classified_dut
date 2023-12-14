class coverage_in extends bvm_cover #(a_tr);
   `uvm_component_utils(coverage_in)

   covergroup transaction_covergroup;  // predefined name of covergroup
      option.per_instance = 1;
      coverpoint coverage_transaction.a { // coverage_transaction is predefined name of transaction instance
        bins d[5] = {[0:256]}; // create 2 bins, one for 0:9 and one for 10:20
        option.at_least = 2;  // at least 3 ocurrences in each bin
      }
   endgroup
   `bvm_cover_utils(a_tr)
    
endclass

