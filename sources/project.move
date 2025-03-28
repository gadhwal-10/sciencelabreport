module ScienceLab::ReportVerification {
    use aptos_framework::signer;

    /// Struct representing a verified lab report.
    struct LabReport has key, store {
        student: address,   // Student who owns the report
        is_verified: bool,  // Verification status
    }

    /// Function to submit a new lab report (unverified by default).
    public fun submit_report(owner: &signer) {
        let report = LabReport {
            student: signer::address_of(owner),
            is_verified: false,
        };
        move_to(owner, report);
    }

    /// Function to verify a submitted lab report.
    public fun verify_report(admin: &signer, student: address) acquires LabReport {
        let report = borrow_global_mut<LabReport>(student);
        report.is_verified = true;
    }
}
