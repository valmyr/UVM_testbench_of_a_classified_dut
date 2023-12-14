class monitor extends uvm_monitor;  
   `uvm_component_utils(monitor)

   uvm_analysis_port #(a_tr) out;
    
   virtual a_if a_vi; 

   function new(string name, uvm_component parent);
      super.new(name, parent);
      out = new("out", this);
   endfunction: new
    
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      assert( uvm_config_db #(virtual a_if)::get(this, "", "a_vi", a_vi) );
   endfunction
   
   task run_phase(uvm_phase phase);
      a_tr tr;
      forever begin
         wait (a_vi.reset === 0);
         tr = a_tr::type_id::create("tr");
         @(posedge a_vi.clock iff (a_vi.valid)); // at next rising clock which has valid set
         `bvm_begin_tr(tr) // start transaction recording	
         tr.a = a_vi.a; // get transaction property value
         tr.a1 = a_vi.a1;
         tr.a2 = a_vi.a2;
         tr.a3 = a_vi.a3;
         tr.a4 = a_vi.a4;
         tr.a5 = a_vi.a5;
         tr.a6 = a_vi.a6;
	 tr.a7 = a_vi.a7;
	 out.write(tr);	 
      end
   endtask

endclass

