import pandas as pd


def sample_n_disasters(src_df_path, dest_df_path, n, seed):
    df = pd.read_csv(src_df_path, encoding="utf-8")
    df_disasters = df[df.disaster == 1]
    df_disasters.sample(n, random_state=seed).to_csv(dest_df_path, encoding='utf-8')


if __name__ == '__main__':
    SEED = 72

    SAMPLE_BERT_RESULTS_DF_DISASTERS_ONLY = "tweets/quotebank-sample-bert-evaluation-disasters-only.csv"
    SAMPLE_BERT_RESULTS_DF_DISASTERS_ONLY_300 = "tweets/quotebank-sample-bert-evaluation-disasters-only-300.csv"
    sample_n_disasters(
        SAMPLE_BERT_RESULTS_DF_DISASTERS_ONLY,
        SAMPLE_BERT_RESULTS_DF_DISASTERS_ONLY_300,
        300, SEED
    )

    SAMPLE_DISTILBERT_RESULTS_DF_DISASTERS_ONLY = "tweets/quotebank-sample-distilbert-evaluation-disasters-only.csv"
    SAMPLE_DISTILBERT_RESULTS_DF_DISASTERS_ONLY_300 = "tweets/quotebank-sample-distilbert-evaluation-disasters-only-300.csv"
    sample_n_disasters(
        SAMPLE_DISTILBERT_RESULTS_DF_DISASTERS_ONLY,
        SAMPLE_DISTILBERT_RESULTS_DF_DISASTERS_ONLY_300,
        300, SEED
    )
