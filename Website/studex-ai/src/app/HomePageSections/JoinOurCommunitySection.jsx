import React from 'react'

const JoinOurCommunitySection = () => {
  return (
    <section id='community' className='bg-white py-20 dark:bg-neutral-900'>
      <div className='container mx-auto px-4'>
        <div className='mx-auto mb-16 max-w-3xl text-center'>
          <span className='inline-block rounded-full bg-teal-100 px-3 py-1 text-sm font-semibold text-teal-800 dark:bg-teal-900/30 dark:text-teal-300'>
            Connect &amp; Learn
          </span>
          <h2 className='animate__animated animate__fadeIn mt-4 text-3xl font-bold leading-tight text-gray-900 dark:text-white sm:text-4xl lg:text-5xl'>
            Join Our Learning Community
          </h2>
          <p className='mt-4 text-xl text-gray-600 dark:text-gray-300'>
            Share knowledge, ask questions, and collaborate with students from
            around the world
          </p>
        </div>

        <div className='mx-auto max-w-7xl'>
          <div className='grid gap-10 md:grid-cols-2'>
            <div className='relative flex items-center justify-center'>
              <div className='animate__animated animate__zoomIn relative mx-auto w-full max-w-[320px]'>
                <div className='relative rounded-[2.5rem] border-[14px] border-gray-800 bg-gray-800 shadow-xl dark:border-gray-700'>
                  <div className='absolute left-1/2 top-0 h-5 w-24 -translate-x-1/2 -translate-y-1/2 rounded-b-lg rounded-t-2xl bg-gray-800 dark:bg-gray-700'></div>
                  <div className='overflow-hidden rounded-[2rem] bg-white dark:bg-gray-800'>
                    <div className='bg-gradient-to-r from-teal-600 to-emerald-600 p-4 text-white'>
                      <div className='flex items-center justify-between'>
                        <div className='flex items-center'>
                          <svg
                            xmlns='http://www.w3.org/2000/svg'
                            className='mr-2 h-6 w-6'
                            fill='none'
                            viewBox='0 0 24 24'
                            stroke='currentColor'
                            stroke-width='2'
                            data-darkreader-inline-stroke=''
                            styles='--darkreader-inline-stroke: currentColor;'
                          >
                            <path
                              stroke-linecap='round'
                              stroke-linejoin='round'
                              d='M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z'
                            ></path>
                          </svg>
                          <h3 className='text-lg font-semibold'>Community</h3>
                        </div>
                        <div className='flex space-x-2'>
                          <button className='rounded-full bg-white/10 p-1.5'>
                            <svg
                              xmlns='http://www.w3.org/2000/svg'
                              className='h-5 w-5'
                              viewBox='0 0 20 20'
                              fill='currentColor'
                              data-darkreader-inline-fill=''
                              styles='--darkreader-inline-fill: currentColor;'
                            >
                              <path
                                fill-rule='evenodd'
                                d='M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z'
                                clip-rule='evenodd'
                              ></path>
                            </svg>
                          </button>
                          <button className='rounded-full bg-white/10 p-1.5'>
                            <svg
                              xmlns='http://www.w3.org/2000/svg'
                              className='h-5 w-5'
                              viewBox='0 0 20 20'
                              fill='currentColor'
                              data-darkreader-inline-fill=''
                              styles='--darkreader-inline-fill: currentColor;'
                            >
                              <path d='M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z'></path>
                            </svg>
                          </button>
                        </div>
                      </div>
                      <div className='mt-3'>
                        <div className='flex justify-center space-x-8'>
                          <button className='border-b-2 border-white pb-2 text-sm font-medium'>
                            All Posts
                          </button>
                          <button className='border-b-2 border-transparent pb-2 text-sm font-medium text-teal-200 hover:border-teal-200'>
                            Following
                          </button>
                          <button className='border-b-2 border-transparent pb-2 text-sm font-medium text-teal-200 hover:border-teal-200'>
                            Popular
                          </button>
                        </div>
                      </div>
                    </div>

                    <div className='h-[450px] overflow-y-auto bg-gray-50 p-3 dark:bg-gray-900'>
                      <div className='mb-4 overflow-hidden rounded-xl bg-white shadow-sm dark:bg-gray-800'>
                        <div className='p-3'>
                          <div className='flex items-center'>
                            <div className='flex h-10 w-10 items-center justify-center rounded-full bg-purple-100 text-purple-700 dark:bg-purple-900/30 dark:text-purple-400'>
                              <span className='text-sm font-semibold'>AP</span>
                            </div>
                            <div className='ml-3'>
                              <div className='text-sm font-medium text-gray-900 dark:text-white'>
                                Anika Patel
                              </div>
                              <div className='flex items-center text-xs text-gray-500 dark:text-gray-400'>
                                <span>10th Grade • Science</span>
                                <span className='mx-1'>•</span>
                                <span>2h ago</span>
                              </div>
                            </div>
                          </div>
                          <div className='mt-3'>
                            <h4 className='text-sm font-semibold text-gray-900 dark:text-white'>
                              Need help with this physics problem!
                            </h4>
                            <p className='mt-1 text-sm text-gray-600 dark:text-gray-400'>
                              Can someone explain how to calculate the force
                              required to accelerate a 10kg object from rest to
                              20m/s in 5 seconds?
                            </p>
                          </div>
                          <div className='mt-3 rounded-lg bg-gray-50 p-2 dark:bg-gray-700/50'>
                            <div className='text-xs font-medium text-gray-500 dark:text-gray-400'>
                              Equation:
                            </div>
                            <div className='mt-1 text-sm font-medium text-gray-800 dark:text-gray-200'>
                              F = ma = m × (v-u)/t
                            </div>
                          </div>
                        </div>
                        <div className='flex border-t border-gray-100 dark:border-gray-700'>
                          <button className='flex flex-1 items-center justify-center py-2 text-xs font-medium text-gray-600 hover:bg-gray-50 dark:text-gray-400 dark:hover:bg-gray-700/50'>
                            <svg
                              xmlns='http://www.w3.org/2000/svg'
                              className='mr-1 h-4 w-4'
                              viewBox='0 0 20 20'
                              fill='currentColor'
                              data-darkreader-inline-fill=''
                              styles='--darkreader-inline-fill: currentColor;'
                            >
                              <path
                                fill-rule='evenodd'
                                d='M14.707 12.707a1 1 0 01-1.414 0L10 9.414l-3.293 3.293a1 1 0 01-1.414-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 010 1.414z'
                                clip-rule='evenodd'
                              ></path>
                            </svg>
                            12 Upvotes
                          </button>
                          <button className='flex flex-1 items-center justify-center py-2 text-xs font-medium text-gray-600 hover:bg-gray-50 dark:text-gray-400 dark:hover:bg-gray-700/50'>
                            <svg
                              xmlns='http://www.w3.org/2000/svg'
                              className='mr-1 h-4 w-4'
                              viewBox='0 0 20 20'
                              fill='currentColor'
                              data-darkreader-inline-fill=''
                              styles='--darkreader-inline-fill: currentColor;'
                            >
                              <path
                                fill-rule='evenodd'
                                d='M18 10c0 3.866-3.582 7-8 7a8.841 8.841 0 01-4.083-.98L2 17l1.338-3.123C2.493 12.767 2 11.434 2 10c0-3.866 3.582-7 8-7s8 3.134 8 7zM7 9H5v2h2V9zm8 0h-2v2h2V9zM9 9h2v2H9V9z'
                                clip-rule='evenodd'
                              ></path>
                            </svg>
                            8 Answers
                          </button>
                          <button className='flex flex-1 items-center justify-center py-2 text-xs font-medium text-gray-600 hover:bg-gray-50 dark:text-gray-400 dark:hover:bg-gray-700/50'>
                            <svg
                              xmlns='http://www.w3.org/2000/svg'
                              className='mr-1 h-4 w-4'
                              viewBox='0 0 20 20'
                              fill='currentColor'
                              data-darkreader-inline-fill=''
                              styles='--darkreader-inline-fill: currentColor;'
                            >
                              <path d='M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z'></path>
                            </svg>
                            Share
                          </button>
                        </div>
                      </div>

                      <div className='mb-4 overflow-hidden rounded-xl bg-white shadow-sm dark:bg-gray-800'>
                        <div className='p-3'>
                          <div className='flex items-center'>
                            <div className='flex h-10 w-10 items-center justify-center rounded-full bg-amber-100 text-amber-700 dark:bg-amber-900/30 dark:text-amber-400'>
                              <span className='text-sm font-semibold'>RK</span>
                            </div>
                            <div className='ml-3'>
                              <div className='text-sm font-medium text-gray-900 dark:text-white'>
                                Rajesh Kumar
                              </div>
                              <div className='flex items-center text-xs text-gray-500 dark:text-gray-400'>
                                <span>12th Grade • Mathematics</span>
                                <span className='mx-1'>•</span>
                                <span>5h ago</span>
                              </div>
                            </div>
                          </div>
                          <div className='mt-3'>
                            <h4 className='text-sm font-semibold text-gray-900 dark:text-white'>
                              Sharing my calculus notes for integration
                            </h4>
                            <p className='mt-1 text-sm text-gray-600 dark:text-gray-400'>
                              I created some comprehensive notes on integration
                              techniques. Hope this helps everyone preparing for
                              finals!
                            </p>
                          </div>
                          <div className='mt-3 rounded-lg bg-amber-50 p-3 dark:bg-amber-900/20'>
                            <div className='flex items-center'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-8 w-8 text-amber-500'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                              <div className='ml-3'>
                                <div className='text-sm font-medium text-amber-800 dark:text-amber-300'>
                                  Calculus_Integration_Notes.pdf
                                </div>
                                <div className='text-xs text-amber-600 dark:text-amber-400'>
                                  12 pages • 2.4 MB
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div className='flex border-t border-gray-100 dark:border-gray-700'>
                          <button className='flex flex-1 items-center justify-center py-2 text-xs font-medium text-teal-600 hover:bg-gray-50 dark:text-teal-400 dark:hover:bg-gray-700/50'>
                            <svg
                              xmlns='http://www.w3.org/2000/svg'
                              className='mr-1 h-4 w-4'
                              viewBox='0 0 20 20'
                              fill='currentColor'
                              data-darkreader-inline-fill=''
                              styles='--darkreader-inline-fill: currentColor;'
                            >
                              <path
                                fill-rule='evenodd'
                                d='M14.707 12.707a1 1 0 01-1.414 0L10 9.414l-3.293 3.293a1 1 0 01-1.414-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 010 1.414z'
                                clip-rule='evenodd'
                              ></path>
                            </svg>
                            27 Upvotes
                          </button>
                          <button className='flex flex-1 items-center justify-center py-2 text-xs font-medium text-gray-600 hover:bg-gray-50 dark:text-gray-400 dark:hover:bg-gray-700/50'>
                            <svg
                              xmlns='http://www.w3.org/2000/svg'
                              className='mr-1 h-4 w-4'
                              viewBox='0 0 20 20'
                              fill='currentColor'
                              data-darkreader-inline-fill=''
                              styles='--darkreader-inline-fill: currentColor;'
                            >
                              <path
                                fill-rule='evenodd'
                                d='M18 10c0 3.866-3.582 7-8 7a8.841 8.841 0 01-4.083-.98L2 17l1.338-3.123C2.493 12.767 2 11.434 2 10c0-3.866 3.582-7 8-7s8 3.134 8 7zM7 9H5v2h2V9zm8 0h-2v2h2V9zM9 9h2v2H9V9z'
                                clip-rule='evenodd'
                              ></path>
                            </svg>
                            14 Comments
                          </button>
                          <button className='flex flex-1 items-center justify-center py-2 text-xs font-medium text-gray-600 hover:bg-gray-50 dark:text-gray-400 dark:hover:bg-gray-700/50'>
                            <svg
                              xmlns='http://www.w3.org/2000/svg'
                              className='mr-1 h-4 w-4'
                              viewBox='0 0 20 20'
                              fill='currentColor'
                              data-darkreader-inline-fill=''
                              styles='--darkreader-inline-fill: currentColor;'
                            >
                              <path d='M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z'></path>
                            </svg>
                            Share
                          </button>
                        </div>
                      </div>

                      <div className='mb-4 overflow-hidden rounded-xl bg-white shadow-sm dark:bg-gray-800'>
                        <div className='p-3'>
                          <div className='flex items-center'>
                            <div className='flex h-10 w-10 items-center justify-center rounded-full bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400'>
                              <span className='text-sm font-semibold'>LN</span>
                            </div>
                            <div className='ml-3'>
                              <div className='text-sm font-medium text-gray-900 dark:text-white'>
                                Lisa Nguyen
                              </div>
                              <div className='flex items-center text-xs text-gray-500 dark:text-gray-400'>
                                <span>11th Grade • Chemistry</span>
                                <span className='mx-1'>•</span>
                                <span>1d ago</span>
                              </div>
                            </div>
                          </div>
                          <div className='mt-3'>
                            <h4 className='text-sm font-semibold text-gray-900 dark:text-white'>
                              How do you balance this chemical equation?
                            </h4>
                            <p className='mt-1 text-sm text-gray-600 dark:text-gray-400'>
                              I'm trying to balance: Fe + O₂ → Fe₂O₃
                            </p>
                          </div>

                          <div className='mt-3 rounded-lg border border-green-100 bg-green-50 p-3 dark:border-green-900/30 dark:bg-green-900/20'>
                            <div className='flex items-center justify-between'>
                              <div className='flex items-center'>
                                <div className='flex h-7 w-7 items-center justify-center rounded-full bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400'>
                                  <span className='text-xs font-semibold'>
                                    MJ
                                  </span>
                                </div>
                                <div className='ml-2 text-xs font-medium text-gray-800 dark:text-gray-200'>
                                  Michael Johnson
                                </div>
                              </div>
                              <div className='rounded-full bg-green-100 px-2 py-0.5 text-xs font-medium text-green-800 dark:bg-green-900/50 dark:text-green-300'>
                                Best Answer
                              </div>
                            </div>
                            <div className='mt-2 text-sm text-gray-700 dark:text-gray-300'>
                              <p>4Fe + 3O₂ → 2Fe₂O₃</p>
                              <p className='mt-1'>
                                Check that atoms are balanced on both sides: 4
                                Fe atoms and 6 O atoms.
                              </p>
                            </div>
                          </div>
                        </div>
                        <div className='flex border-t border-gray-100 dark:border-gray-700'>
                          <button className='flex flex-1 items-center justify-center py-2 text-xs font-medium text-gray-600 hover:bg-gray-50 dark:text-gray-400 dark:hover:bg-gray-700/50'>
                            <svg
                              xmlns='http://www.w3.org/2000/svg'
                              className='mr-1 h-4 w-4'
                              viewBox='0 0 20 20'
                              fill='currentColor'
                              data-darkreader-inline-fill=''
                              styles='--darkreader-inline-fill: currentColor;'
                            >
                              <path
                                fill-rule='evenodd'
                                d='M14.707 12.707a1 1 0 01-1.414 0L10 9.414l-3.293 3.293a1 1 0 01-1.414-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 010 1.414z'
                                clip-rule='evenodd'
                              ></path>
                            </svg>
                            18 Upvotes
                          </button>
                          <button className='flex flex-1 items-center justify-center py-2 text-xs font-medium text-gray-600 hover:bg-gray-50 dark:text-gray-400 dark:hover:bg-gray-700/50'>
                            <svg
                              xmlns='http://www.w3.org/2000/svg'
                              className='mr-1 h-4 w-4'
                              viewBox='0 0 20 20'
                              fill='currentColor'
                              data-darkreader-inline-fill=''
                              styles='--darkreader-inline-fill: currentColor;'
                            >
                              <path
                                fill-rule='evenodd'
                                d='M18 10c0 3.866-3.582 7-8 7a8.841 8.841 0 01-4.083-.98L2 17l1.338-3.123C2.493 12.767 2 11.434 2 10c0-3.866 3.582-7 8-7s8 3.134 8 7zM7 9H5v2h2V9zm8 0h-2v2h2V9zM9 9h2v2H9V9z'
                                clip-rule='evenodd'
                              ></path>
                            </svg>
                            5 Answers
                          </button>
                          <button className='flex flex-1 items-center justify-center py-2 text-xs font-medium text-gray-600 hover:bg-gray-50 dark:text-gray-400 dark:hover:bg-gray-700/50'>
                            <svg
                              xmlns='http://www.w3.org/2000/svg'
                              className='mr-1 h-4 w-4'
                              viewBox='0 0 20 20'
                              fill='currentColor'
                              data-darkreader-inline-fill=''
                              styles='--darkreader-inline-fill: currentColor;'
                            >
                              <path d='M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z'></path>
                            </svg>
                            Share
                          </button>
                        </div>
                      </div>

                      <div className='sticky bottom-0 rounded-xl bg-white p-3 shadow-md dark:bg-gray-800'>
                        <div className='flex items-center'>
                          <div className='flex h-8 w-8 items-center justify-center rounded-full bg-teal-100 text-teal-700 dark:bg-teal-900/30 dark:text-teal-400'>
                            <span className='text-xs font-semibold'>ME</span>
                          </div>
                          <input
                            type='text'
                            placeholder='Ask a question or share something...'
                            className='ml-3 flex-grow rounded-full border border-gray-200 bg-gray-50 px-4 py-2 text-sm focus:border-teal-500 focus:outline-none focus:ring-1 focus:ring-teal-500 dark:border-gray-700 dark:bg-gray-700 dark:text-gray-200'
                          />
                          <button className='ml-2 rounded-full bg-teal-600 p-2 text-white hover:bg-teal-700 dark:bg-teal-700 dark:hover:bg-teal-600'>
                            <svg
                              xmlns='http://www.w3.org/2000/svg'
                              className='h-4 w-4'
                              viewBox='0 0 20 20'
                              fill='currentColor'
                              data-darkreader-inline-fill=''
                              styles='--darkreader-inline-fill: currentColor;'
                            >
                              <path d='M10.894 2.553a1 1 0 00-1.788 0l-7 14a1 1 0 001.169 1.409l5-1.429A1 1 0 009 15.571V11a1 1 0 112 0v4.571a1 1 0 00.725.962l5 1.428a1 1 0 001.17-1.408l-7-14z'></path>
                            </svg>
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div className='animate__animated animate__fadeInRight animate__delay-1s absolute -right-16 top-10 w-48 rounded-lg border border-teal-100 bg-white p-3 shadow-lg dark:border-teal-900/30 dark:bg-neutral-800'>
                  <div className='flex items-center justify-between'>
                    <div className='flex h-8 w-8 items-center justify-center rounded-full bg-teal-100 text-teal-600 dark:bg-teal-900/30 dark:text-teal-400'>
                      <svg
                        xmlns='http://www.w3.org/2000/svg'
                        className='h-4 w-4'
                        viewBox='0 0 20 20'
                        fill='currentColor'
                        data-darkreader-inline-fill=''
                        styles='--darkreader-inline-fill: currentColor;'
                      >
                        <path
                          fill-rule='evenodd'
                          d='M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z'
                          clip-rule='evenodd'
                        ></path>
                      </svg>
                    </div>
                    <div className='text-xs font-semibold text-gray-900 dark:text-white'>
                      New Comment
                    </div>
                    <button className='text-gray-400 hover:text-gray-600 dark:hover:text-gray-300'>
                      <svg
                        xmlns='http://www.w3.org/2000/svg'
                        className='h-4 w-4'
                        viewBox='0 0 20 20'
                        fill='currentColor'
                        data-darkreader-inline-fill=''
                        styles='--darkreader-inline-fill: currentColor;'
                      >
                        <path
                          fill-rule='evenodd'
                          d='M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z'
                          clip-rule='evenodd'
                        ></path>
                      </svg>
                    </button>
                  </div>
                  <p className='mt-2 text-xs text-gray-600 dark:text-gray-400'>
                    Sanjay commented on your physics question
                  </p>
                </div>

                <div className='animate__animated animate__fadeInLeft animate__delay-2s absolute -left-14 bottom-20 w-40 rounded-lg border border-purple-100 bg-white p-3 shadow-lg dark:border-purple-900/30 dark:bg-neutral-800'>
                  <div className='flex flex-col items-center text-center'>
                    <div className='flex h-10 w-10 items-center justify-center rounded-full bg-purple-100 text-purple-600 dark:bg-purple-900/30 dark:text-purple-400'>
                      <span className='text-sm font-semibold'>SK</span>
                    </div>
                    <div className='mt-2 text-sm font-medium text-gray-900 dark:text-white'>
                      Sara Khan
                    </div>
                    <div className='text-xs text-gray-500 dark:text-gray-400'>
                      Chemistry Expert
                    </div>
                    <button className='mt-2 w-full rounded-full bg-purple-600 px-3 py-1 text-xs font-medium text-white hover:bg-purple-700 dark:bg-purple-700 dark:hover:bg-purple-600'>
                      Follow
                    </button>
                  </div>
                </div>
              </div>
            </div>

            <div className='flex flex-col justify-center'>
              <h3 className='text-2xl font-bold text-gray-900 dark:text-white md:text-3xl'>
                Learn Together, Grow Together
              </h3>
              <p className='mt-4 text-lg text-gray-600 dark:text-gray-400'>
                Connect with fellow students and educators in our vibrant
                learning community. Ask questions, share knowledge, and
                collaborate to enhance your educational journey.
              </p>

              <div className='mt-10 space-y-8'>
                <div className='animate__animated animate__fadeInRight flex'>
                  <div className='flex-shrink-0'>
                    <div className='flex h-12 w-12 items-center justify-center rounded-md bg-teal-100 text-teal-600 dark:bg-teal-900/30 dark:text-teal-400'>
                      <svg
                        xmlns='http://www.w3.org/2000/svg'
                        className='h-6 w-6'
                        fill='none'
                        viewBox='0 0 24 24'
                        stroke='currentColor'
                        stroke-width='2'
                        data-darkreader-inline-stroke=''
                        styles='--darkreader-inline-stroke: currentColor;'
                      >
                        <path
                          stroke-linecap='round'
                          stroke-linejoin='round'
                          d='M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z'
                        ></path>
                      </svg>
                    </div>
                  </div>
                  <div className='ml-4'>
                    <h4 className='text-xl font-semibold text-gray-900 dark:text-white'>
                      Ask &amp; Answer Questions
                    </h4>
                    <p className='mt-2 text-gray-600 dark:text-gray-400'>
                      Post your academic questions and receive answers from
                      peers and subject matter experts. Help others by sharing
                      your knowledge and expertise.
                    </p>
                  </div>
                </div>

                <div className='animate__animated animate__fadeInRight animate__delay-1s flex'>
                  <div className='flex-shrink-0'>
                    <div className='flex h-12 w-12 items-center justify-center rounded-md bg-purple-100 text-purple-600 dark:bg-purple-900/30 dark:text-purple-400'>
                      <svg
                        xmlns='http://www.w3.org/2000/svg'
                        className='h-6 w-6'
                        fill='none'
                        viewBox='0 0 24 24'
                        stroke='currentColor'
                        stroke-width='2'
                        data-darkreader-inline-stroke=''
                        styles='--darkreader-inline-stroke: currentColor;'
                      >
                        <path
                          stroke-linecap='round'
                          stroke-linejoin='round'
                          d='M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z'
                        ></path>
                      </svg>
                    </div>
                  </div>
                  <div className='ml-4'>
                    <h4 className='text-xl font-semibold text-gray-900 dark:text-white'>
                      Connect with Peers
                    </h4>
                    <p className='mt-2 text-gray-600 dark:text-gray-400'>
                      Follow classmates and subject experts to build your
                      learning network. Collaborate with students who share
                      similar academic interests and goals.
                    </p>
                  </div>
                </div>

                <div className='animate__animated animate__fadeInRight animate__delay-2s flex'>
                  <div className='flex-shrink-0'>
                    <div className='flex h-12 w-12 items-center justify-center rounded-md bg-amber-100 text-amber-600 dark:bg-amber-900/30 dark:text-amber-400'>
                      <svg
                        xmlns='http://www.w3.org/2000/svg'
                        className='h-6 w-6'
                        fill='none'
                        viewBox='0 0 24 24'
                        stroke='currentColor'
                        stroke-width='2'
                        data-darkreader-inline-stroke=''
                        styles='--darkreader-inline-stroke: currentColor;'
                      >
                        <path
                          stroke-linecap='round'
                          stroke-linejoin='round'
                          d='M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z'
                        ></path>
                      </svg>
                    </div>
                  </div>
                  <div className='ml-4'>
                    <h4 className='text-xl font-semibold text-gray-900 dark:text-white'>
                      Real-time Notifications
                    </h4>
                    <p className='mt-2 text-gray-600 dark:text-gray-400'>
                      Get instant alerts when someone answers your questions,
                      comments on your posts, or follows you. Stay engaged with
                      timely updates from your learning community.
                    </p>
                  </div>
                </div>

                <div className='animate__animated animate__fadeInRight animate__delay-3s flex'>
                  <div className='flex-shrink-0'>
                    <div className='flex h-12 w-12 items-center justify-center rounded-md bg-rose-100 text-rose-600 dark:bg-rose-900/30 dark:text-rose-400'>
                      <svg
                        xmlns='http://www.w3.org/2000/svg'
                        className='h-6 w-6'
                        fill='none'
                        viewBox='0 0 24 24'
                        stroke='currentColor'
                        stroke-width='2'
                        data-darkreader-inline-stroke=''
                        styles='--darkreader-inline-stroke: currentColor;'
                      >
                        <path
                          stroke-linecap='round'
                          stroke-linejoin='round'
                          d='M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z'
                        ></path>
                      </svg>
                    </div>
                  </div>
                  <div className='ml-4'>
                    <h4 className='text-xl font-semibold text-gray-900 dark:text-white'>
                      Share Study Materials
                    </h4>
                    <p className='mt-2 text-gray-600 dark:text-gray-400'>
                      Exchange notes, study guides, and learning resources with
                      your peers. Contribute to the community by sharing
                      valuable educational content.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className='mx-auto mt-20 max-w-6xl rounded-2xl bg-gradient-to-r from-teal-50 to-emerald-50 p-8 dark:from-teal-900/30 dark:to-emerald-900/30'>
          <div className='text-center'>
            <h3 className='text-2xl font-bold text-gray-900 dark:text-white'>
              Our Growing Community
            </h3>
            <p className='mt-2 text-gray-600 dark:text-gray-400'>
              Join thousands of students and educators from around the world
            </p>
          </div>

          <div className='mt-10 grid gap-6 sm:grid-cols-2 lg:grid-cols-4'>
            <div className='animate__animated animate__fadeIn rounded-xl bg-white p-6 text-center shadow-md dark:bg-neutral-800'>
              <div className='text-3xl font-bold text-teal-600 dark:text-teal-400'>
                50K+
              </div>
              <div className='mt-2 text-sm font-medium text-gray-600 dark:text-gray-400'>
                Active Students
              </div>
            </div>

            <div className='animate__animated animate__fadeIn animate__delay-1s rounded-xl bg-white p-6 text-center shadow-md dark:bg-neutral-800'>
              <div className='text-3xl font-bold text-purple-600 dark:text-purple-400'>
                100K+
              </div>
              <div className='mt-2 text-sm font-medium text-gray-600 dark:text-gray-400'>
                Questions Asked
              </div>
            </div>

            <div className='animate__animated animate__fadeIn animate__delay-2s rounded-xl bg-white p-6 text-center shadow-md dark:bg-neutral-800'>
              <div className='text-3xl font-bold text-emerald-600 dark:text-emerald-400'>
                250K+
              </div>
              <div className='mt-2 text-sm font-medium text-gray-600 dark:text-gray-400'>
                Answers Provided
              </div>
            </div>

            <div className='animate__animated animate__fadeIn animate__delay-3s rounded-xl bg-white p-6 text-center shadow-md dark:bg-neutral-800'>
              <div className='text-3xl font-bold text-amber-600 dark:text-amber-400'>
                5K+
              </div>
              <div className='mt-2 text-sm font-medium text-gray-600 dark:text-gray-400'>
                Subject Experts
              </div>
            </div>
          </div>
        </div>

        <div className='mx-auto mt-20 max-w-6xl'>
          <div className='text-center'>
            <h3 className='text-2xl font-bold text-gray-900 dark:text-white'>
              What Our Community Says
            </h3>
            <p className='mt-2 text-gray-600 dark:text-gray-400'>
              Hear from students who have benefited from our collaborative
              learning environment
            </p>
          </div>

          <div className='mt-10 grid gap-6 sm:grid-cols-2 lg:grid-cols-3'>
            <div className='animate__animated animate__fadeIn overflow-hidden rounded-xl bg-white p-6 shadow-lg transition-transform duration-300 hover:-translate-y-1 dark:bg-neutral-800'>
              <div className='flex items-center'>
                <div className='flex h-12 w-12 items-center justify-center rounded-full bg-indigo-100 text-indigo-700 dark:bg-indigo-900/30 dark:text-indigo-400'>
                  <span className='text-sm font-semibold'>RP</span>
                </div>
                <div className='ml-3'>
                  <div className='text-base font-semibold text-gray-900 dark:text-white'>
                    Rahul Patel
                  </div>
                  <div className='text-sm text-gray-500 dark:text-gray-400'>
                    12th Grade, Mumbai
                  </div>
                </div>
              </div>
              <div className='mt-4'>
                <div className='text-yellow-400 flex'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                </div>
                <p className='mt-3 text-gray-600 dark:text-gray-400'>
                  "The community feature has been a game-changer for my exam
                  preparation. Whenever I'm stuck on a difficult problem, I get
                  answers within minutes. I've also made friends with students
                  who have similar academic interests."
                </p>
              </div>
            </div>

            <div className='animate__animated animate__fadeIn animate__delay-1s overflow-hidden rounded-xl bg-white p-6 shadow-lg transition-transform duration-300 hover:-translate-y-1 dark:bg-neutral-800'>
              <div className='flex items-center'>
                <div className='flex h-12 w-12 items-center justify-center rounded-full bg-pink-100 text-pink-700 dark:bg-pink-900/30 dark:text-pink-400'>
                  <span className='text-sm font-semibold'>SC</span>
                </div>
                <div className='ml-3'>
                  <div className='text-base font-semibold text-gray-900 dark:text-white'>
                    Sarah Chen
                  </div>
                  <div className='text-sm text-gray-500 dark:text-gray-400'>
                    11th Grade, Singapore
                  </div>
                </div>
              </div>
              <div className='mt-4'>
                <div className='text-yellow-400 flex'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                </div>
                <p className='mt-3 text-gray-600 dark:text-gray-400'>
                  "I love being able to share my study notes and help others
                  understand complex topics. The community has a supportive
                  atmosphere where everyone is eager to learn and help each
                  other. It's truly enhanced my learning experience."
                </p>
              </div>
            </div>

            <div className='animate__animated animate__fadeIn animate__delay-2s overflow-hidden rounded-xl bg-white p-6 shadow-lg transition-transform duration-300 hover:-translate-y-1 dark:bg-neutral-800'>
              <div className='flex items-center'>
                <div className='flex h-12 w-12 items-center justify-center rounded-full bg-amber-100 text-amber-700 dark:bg-amber-900/30 dark:text-amber-400'>
                  <span className='text-sm font-semibold'>KJ</span>
                </div>
                <div className='ml-3'>
                  <div className='text-base font-semibold text-gray-900 dark:text-white'>
                    Kevin Johnson
                  </div>
                  <div className='text-sm text-gray-500 dark:text-gray-400'>
                    9th Grade, Toronto
                  </div>
                </div>
              </div>
              <div className='mt-4'>
                <div className='text-yellow-400 flex'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                </div>
                <p className='mt-3 text-gray-600 dark:text-gray-400'>
                  "As a new high school student, I was struggling with
                  mathematics. The community helped me connect with older
                  students who explained concepts in a way that made sense to
                  me. My grades have improved significantly since I started
                  using this app."
                </p>
              </div>
            </div>
          </div>
        </div>

        <div className='mx-auto mt-20 max-w-5xl rounded-2xl bg-gradient-to-r from-teal-600 to-emerald-600 p-8 text-center text-white shadow-xl dark:from-teal-700 dark:to-emerald-700'>
          <h3 className='text-2xl font-bold md:text-3xl'>
            Join Our Learning Community Today
          </h3>
          <p className='mt-4 text-lg text-teal-100'>
            Connect with peers, share knowledge, and enhance your learning
            experience
          </p>
          <div className='mt-8'>
            <a
              href='#download'
              className='animate__animated animate__pulse animate__infinite animate__slow inline-flex items-center rounded-lg bg-white px-6 py-3 text-base font-medium text-teal-600 shadow-lg transition-transform duration-300 hover:-translate-y-1 hover:shadow-xl'
            >
              Download App
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='ml-2 h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path
                  fill-rule='evenodd'
                  d='M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z'
                  clip-rule='evenodd'
                ></path>
              </svg>
            </a>
          </div>
        </div>
      </div>
    </section>
  )
}

export default JoinOurCommunitySection
